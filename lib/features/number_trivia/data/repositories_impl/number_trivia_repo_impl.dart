import 'package:dartz/dartz.dart';
import 'package:tdd/core/error/exceptions.dart';
import 'package:tdd/core/error/failure.dart';
import 'package:tdd/core/network/network_info.dart';
import 'package:tdd/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:tdd/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:tdd/features/number_trivia/data/models/number_trivia_models.dart';
import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

typedef Future<NumberTriviaModels> _ConcreteOrRandomChooser();


class NumberTriviaRepoImpl extends NumberTriviaRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  NumberTriviaRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    final result = await _getTrivia(() => remoteDataSource.getConcreteNumberTrivia(number));
  return result; 
    
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async{
    final result = await _getTrivia(() => remoteDataSource.getRandomNumberTrivia());
  return result; 
  }

    Future<Either<Failure, NumberTrivia>> _getTrivia(Future<NumberTriviaModels> Function() getConcreteOrRandom) async{
         if (await networkInfo.isConnected){
       try {
      final remoteTrivia = await getConcreteOrRandom();
    localDataSource.cachedNumberTrivia(remoteTrivia);
    return Right(remoteTrivia);

    } on ServerException {
      return Left(ServerFailure());
    }
   }
    else{
      try {
        return Right(await localDataSource.getLastNumberTrivia());
      } on CacheException {
        return Left(CacheFailure());
      }
    }

   
    }

}
