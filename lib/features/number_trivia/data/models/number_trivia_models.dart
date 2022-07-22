import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModels extends NumberTrivia {
  const NumberTriviaModels({required super.text, required super.number});

  factory NumberTriviaModels.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModels(text: json['text'], 
    number: ( json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson(){
    return {
      'text':text,
      "number": number
    };
  }
}
