class SearchResult {
  late final String title;
  late final String website;
  late final String url;
  late final String snippet;
  late final dynamic? imageUrl;

  SearchResult(
      {required this.title,
      required this.website,
      required this.url,
      required this.snippet,
      this.imageUrl});

  factory SearchResult.fromJson(Map<String, dynamic> map) {
    return SearchResult(
        title: map['title'],
        website: map['displayLink'].replaceAll("www.", ""),
        url: map['link'],
        snippet: map['snippet'],
        imageUrl: map['pagemap']['cse_thumbnail']?[0]['src']);
  }
}
