import 'package:flutter/services.dart';
import 'package:flutter_app_demo/Model/levelDetailsModel.dart';

class ReadJsonFile {
  Future<List<LevelDetailsModel>?> fetchLevelDetails(String jsonPath) async {
    final String response =
        await rootBundle.loadString(jsonPath);

    return levelDetailsModelFromJson(response);
  }
}