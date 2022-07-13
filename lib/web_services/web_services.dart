// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewsWebServices {
  late Dio dio;

  NewsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getNewsData(Map<String, String> query) async {
    try {
      Response response = await dio.get('top-headlines',
          queryParameters: {'apiKey': apiKey}..addAll(query));
      // print(response.data.toString());
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('error is : ' + e.toString());
      return {};
    }
  }

  // ex : GET https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=0c132ad24dad438896c7b04e09945d9b
  Future<Map<String, dynamic>> getCategoryNews(String category) async {
    try {
      Response response = await dio.get(
        'top-headlines',
        queryParameters: {
          'apiKey': apiKey,
          'country': 'eg',
          'category': category,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('error is : ' + e.toString());
      return {};
    }
  }

  Future<Map<String, dynamic>> getSearchNews(String? search) async {
    try {
      Response response = await dio.get(
        'everything',
        queryParameters: {
          'apiKey': apiKey,
          'q': search,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('error is : ' + e.toString());
      return {};
    }
  }
}
