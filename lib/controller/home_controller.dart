import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:json_task/model/game_model.dart';

class HomeController extends GetxController{
  var gameData = GameModel(data: []).obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getGameDataList();
    super.onInit();
  }

  void getGameDataList()async{
    isLoading(true);
    var jsonText = await rootBundle.loadString('assets/json/game_json.json');
    print('Json Data: $jsonText');
    gameData.value = GameModel.fromJson(jsonDecode(jsonText));
    isLoading(false);
  }

}