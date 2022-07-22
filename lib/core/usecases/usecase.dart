import 'package:dartz/dartz.dart';

import '../../features/number_trivia/domain/entities/number_trivia.dart';
import '../error/failure.dart';

//this is like a contract class or interface for all usecases since the all will have a call function 
abstract class Usecase<Type,Params> {
  //The "TYPE" is the return type and is not hard coded so that each use case can have it's own return type if it wanted to.
  // The PARAMS" is any parameter the function would require
  Future<Either<Failure,NumberTrivia>> call(Params params);
}