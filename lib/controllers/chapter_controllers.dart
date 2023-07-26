import 'dart:convert';
import 'package:auragita/modals/chapter_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChapterController extends ChangeNotifier {
  List<ChapterModal> AllChapter = [];

  ChapterController() {
    loadJson();
  }

  loadJson() async {
    String response = await rootBundle.loadString('assets/json/chapter.json');
    debugPrint("Response ; $response");
    List AllData = jsonDecode(response);
    debugPrint("List ; $AllData");
    AllChapter = AllData.map((e) => ChapterModal.fromMap(data: e)).toList();

    notifyListeners();
  }
}
