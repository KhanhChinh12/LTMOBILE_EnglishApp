import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning_english/dictionary/response_model.dart';

class API {
  static const String baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  static Future<PiyoJrDictionaryModel> fetchMeaning(String word) async {
    final response = await http.get(Uri.parse("$baseUrl$word"));
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return PiyoJrDictionaryModel.fromJson(data[0]);
    }else{
      throw Exception("Failed to load meaning");
    }
  }
}
