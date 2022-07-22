part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable{}

class GetRandomNumberTriviaEvent extends NumberTriviaEvent{
  @override
  List<Object?> get props => [];
}

class GetConcreteNumberTriviaEvent extends NumberTriviaEvent{
  final String numberString;
  GetConcreteNumberTriviaEvent({required this.numberString});
  @override
  List<Object?> get props => [numberString];
}
