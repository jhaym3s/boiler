  
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd/core/error/failure.dart';
import 'package:tdd/core/usecases/usecase.dart';
import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

class GetRandomNumberTrivia implements Usecase<NumberTrivia,NoParams> {

  final NumberTriviaRepository numberTriviaRepository;
  GetRandomNumberTrivia({
    required this.numberTriviaRepository,
  });
  
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async{
    return await numberTriviaRepository.getRandomNumberTrivia();
  }
  
 

  
}

class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
