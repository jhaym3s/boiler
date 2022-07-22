import 'package:dartz/dartz.dart';

import '../error/failure.dart';

class InputConverter{
  Either<Failure,int> stringToUnsignedInt(String numberString){
   try {
      int number = int.parse(numberString);
      if(number < 0) throw const FormatException();
    return(Right(number));
   }on FormatException {
     return Left(InvalidInputFailure());
   }
   
  }
}