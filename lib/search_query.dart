import 'package:vt_hacks_submission/search_result.dart';

class SearchQuery {
  late final String query;
  late final double searchTime;
  late final List<SearchResult> results;

  SearchQuery(
      {required this.query, required this.searchTime, required this.results});

  factory SearchQuery.fromJson(Map<String, dynamic> map) {
    List<dynamic> items = map["items"];

    return SearchQuery(
        query: map["queries"]["request"][0]["searchTerms"],
        searchTime:
            double.parse(map["searchInformation"]["formattedSearchTime"]),
        results: List.generate(
            items.length, (index) => SearchResult.fromJson(items[index])));
  }
}
