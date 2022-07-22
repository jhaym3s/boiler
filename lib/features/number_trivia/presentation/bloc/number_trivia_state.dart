part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaState extends Equatable {}

class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends NumberTriviaState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends NumberTriviaState {
  final NumberTrivia numberTrivia;
  LoadedState({required this.numberTrivia});
  @override
  List<Object?> get props => [numberTrivia];
}

class ErrorState extends NumberTriviaState {
  final String message;
  ErrorState({
    required this.message,
  });
  
  @override
  List<Object?> get props => [message];

}
