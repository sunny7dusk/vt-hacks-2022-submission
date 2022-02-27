import 'package:flutter/material.dart';

class NewsArticle {
  String title;
  String newsSource;
  String articleUrl;
  String biasRating;
  String credibilityRating;
  String factualReporting;
  String publishedDate;
  String description;

  NewsArticle(
      {required this.title,
      required this.newsSource,
      this.articleUrl = "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      required this.biasRating,
      required this.credibilityRating,
      required this.factualReporting,
      this.publishedDate = "",
      this.description = ""});

  Text getBiasRating() {
    return Text(
      biasRating,
      style: TextStyle(
          color: biasRating == "LEFT"
              ? Colors.green
              : biasRating == "RIGHT"
                  ? Colors.red
                  : Colors.grey),
    );
  }

  Text getCredibilityRating() {
    return Text(
      credibilityRating,
      style: TextStyle(
          color: credibilityRating == "LOW CREDIBILITY"
              ? Colors.red
              : credibilityRating == "MEDIUM CREDIBILITY"
                  ? Colors.grey
                  : Colors.green),
    );
  }
}
