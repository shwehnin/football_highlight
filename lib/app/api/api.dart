import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:football_highlight/app/constant/constants.dart';
import 'package:football_highlight/app/models/football_highlight.dart';

class Api {
  static Future<List<FootballModel>> getFootballHighlights(int? page) async {
    var url =
        "${Constants.baseUrl}${Constants.apiUrl}/feed/?token=${Constants.apiToken}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body);
      List<FootballModel> footballHighlights = (decodeData['response'] as List)
          .map((json) => FootballModel.fromJson(json))
          .toList();
      return footballHighlights;
    } else {
      return null!;
    }
  }
}
