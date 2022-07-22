import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tdd/core/util/input_converter.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/usecase/get_concrete_number_trivia.dart';
import '../../domain/usecase/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;
  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia, 
    required this.inputConverter,}
  ) : super(NumberTriviaInitial()) {
    on<GetConcreteNumberTriviaEvent>(concrete);
  }

  FutureOr<void> concrete(GetConcreteNumberTriviaEvent event, Emitter<NumberTriviaState> emit) {
    
    final inputNumber = inputConverter.stringToUnsignedInt(event.numberString);
    inputNumber.fold((l) => emit(ErrorState(message: _mapFailureToMessage(l))), (r) {
        emit(LoadingState());
        
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "SERVER_FAILURE" ;
    case CacheFailure:
      return "CACHE_FAILURE";
    default:
      return 'Unexpected Error';
  }
}