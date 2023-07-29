import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchProductNotifier, String>((ref) {
  return SearchProductNotifier();
});

class SearchProductNotifier extends StateNotifier<String> {
  SearchProductNotifier() : super('');

  void productSearch(String word) {
    state = word;
  }

  void deleteSearch() {
    state = '';
  }
}
