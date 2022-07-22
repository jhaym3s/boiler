
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/features/number_trivia/domain/repositories/number_trivia_repo.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

//class GetConcreteNumberTrivia implements Usecase<NumberTrivia,int>{
  //the above code works just find but let's make a little change by creating a class that has all the parameter. For instance for a case where there are more than one parameters
  
class GetConcreteNumberTrivia implements Usecase<NumberTrivia,Params>{
  final NumberTriviaRepository triviaDomainRepository;
  GetConcreteNumberTrivia(this.triviaDomainRepository);
  //when you name a function "call" it makes it an example of callable classes. 
  // so it can be called by calling just writing the name of the class(instance)
  //initial
  @override
  Future<Either<Failure,NumberTrivia>> call (Params params) async {
    return await triviaDomainRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  final int number;
  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}