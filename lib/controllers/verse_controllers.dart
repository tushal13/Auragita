import 'dart:convert';
import 'package:auragita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerseController extends ChangeNotifier {
  List<VerseModal> AllVerse = [];
  List<VerseModal> allFavorite = [];
  List<VerseModal> allBookmark = [];

  VerseController() {
    loadJson();
  }

  loadJson() async {
    String response = await rootBundle.loadString('assets/json/verse.json');
    debugPrint("Response ; $response");
    List AllData = jsonDecode(response);
    debugPrint("List ; $AllData");
    AllVerse = AllData.map((e) => VerseModal.fromMap(data: e)).toList();

    notifyListeners();
  }

  bool isFavorite(VerseModal verse) {
    return allFavorite.contains(verse);
  }

   addToFavorites({required VerseModal verse}) {
    if (!allFavorite.contains(verse)) {
      allFavorite.add(verse);
      notifyListeners();
    }
  }

   removeFromFavorites({required int index}) {
    allFavorite.removeAt(index);
    notifyListeners();
  }

  bool isBookmark(VerseModal verse) {
    return allBookmark.contains(verse);
  }

   addToBookmark({required VerseModal verse}) {
    if (!allBookmark.contains(verse)) {
      allBookmark.add(verse);
      notifyListeners();
    }
  }

   removeFromBookmark({required int index}) {
    allBookmark.removeAt(index);
    notifyListeners();
  }
}
