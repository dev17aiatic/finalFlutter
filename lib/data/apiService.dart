import 'package:app1/models/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  String UrlForApi(optionUrl) {
    switch (optionUrl) {
      //All articles about Tesla from the last month, sorted by recent first
      case 1:
        return 'https://newsapi.org/v2/everything?q=tesla&from=2021-02-22&sortBy=publishedAt&apiKey=1f38c35ce8a94bb9a196c671b67816d9';
      //Top business headlines in the US right now
      case 2:
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1f38c35ce8a94bb9a196c671b67816d9';
      //All articles mentioning Apple from yesterday, sorted by popular publishers first
      case 3:
        return 'https://newsapi.org/v2/everything?q=apple&from=2021-02-22&to=2021-02-22&sortBy=popularity&apiKey=1f38c35ce8a94bb9a196c671b67816d9';
      //Top headlines from TechCrunch right now
      case 4:
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1f38c35ce8a94bb9a196c671b67816d9';
      //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
      case 5:
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1f38c35ce8a94bb9a196c671b67816d9';
    }
  }

  GetDio({@required int optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(UrlForApi(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      print('Algo ha salido mal');
    }
  }
}
