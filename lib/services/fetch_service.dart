import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:step_2/constants/api_constants.dart';

import 'package:step_2/models/topnews_model.dart';

class TopNewsRepo {
  final http.Client client = http.Client();

  Future<TopNews?> fetchTopNews() async {
    final Uri uri = Uri.parse(ApiConst.topNews);
    final http.Response response = await client.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // print(response.body);
      // print(response.body.runtimeType);

      final data = jsonDecode(response.body);
      // print(data);
      // print(data.runtimeType);
      final topNews = TopNews.fromJson(data);
      // print(topNews);
      // print(topNews.runtimeType);
      return topNews;
    } else {
      return null;
    }
  }
}
