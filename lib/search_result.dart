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
    dynamic domain = map["displayLink"].split(".");

    return SearchResult(
        title: map["title"],
        website: domain[domain.length - 2],
        url: map["link"],
        snippet: map["snippet"],
        imageUrl: map["pagemap"]["cse_thumbnail"]?[0]["src"]);
  }
}
