import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tdd/core/error/exceptions.dart';

import 'package:tdd/features/number_trivia/data/models/number_trivia_models.dart';

abstract class RemoteDataSource {
  Future<NumberTriviaModels> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModels> getRandomNumberTrivia();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client httpClient;
  RemoteDataSourceImpl({
    required this.httpClient,
  });
  @override
  Future<NumberTriviaModels> getConcreteNumberTrivia(int number) => getRemoteTrivia('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModels> getRandomNumberTrivia() => getRemoteTrivia('http://numbersapi.com/random');

  Future<NumberTriviaModels> getRemoteTrivia(String uri)async{
    final url = Uri.parse(uri);
    final response = await httpClient.get(url, headers: {'Content-Type': 'application/json'});
    if(response.statusCode == 200){
      return NumberTriviaModels.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }

}
