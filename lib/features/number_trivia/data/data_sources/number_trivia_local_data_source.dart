import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd/core/error/exceptions.dart';
import 'package:tdd/features/number_trivia/data/models/number_trivia_models.dart';

abstract class LocalDataSource {
  Future<NumberTriviaModels> getLastNumberTrivia();

  Future<void> cachedNumberTrivia(NumberTriviaModels triviaToCache);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({
    required this.sharedPreferences,
  });

  Future<NumberTriviaModels> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
    if (jsonString != null) {
      return Future.value(NumberTriviaModels.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachedNumberTrivia(NumberTriviaModels triviaToCache) {
    final result = sharedPreferences.setString(
        'CACHED_NUMBER_TRIVIA', json.encode(triviaToCache.toJson()));
    return result;
  }
}
