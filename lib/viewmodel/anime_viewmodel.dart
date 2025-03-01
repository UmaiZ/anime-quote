import 'package:animechan/helper/network.dart';
import 'package:animechan/model/anime_quote.dart';
import 'package:flutter/material.dart';

class AnimeViewModel extends ChangeNotifier {
  AnimeQuote? animeQuote;
  bool isLoading = true;
  String? errorMessage;
  final NetworkHelper _networkHelper = NetworkHelper();

  Future<void> fetchQuote() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final jsonData = await _networkHelper.getApi(ApiUrls().fetchAnime);
      if (jsonData != null) {
        animeQuote = AnimeQuote.fromJson(jsonData);
      } else {
        errorMessage = 'No data received. Please try again later.';
      }
    } catch (e) {
      errorMessage = 'Error fetching data: ${e.toString()}';
    }
    isLoading = false;
    notifyListeners();
  }
}
