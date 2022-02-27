import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';
import 'package:vt_hacks_submission/page/sarang.dart';
import 'package:vt_hacks_submission/page/loading_animation_page.dart';
import 'package:vt_hacks_submission/page/news_article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NewsArticle> newsArticle = List.generate(
    50,
    (index) => NewsArticle(
        newsSource: "CNN",
        title:
            "Ukraine's outgunned forces slow Russian invasion in number of cities",
        biasRating: "LEFT",
        credibilityRating: "MEDIUM CREDIBILITY",
        factualReporting: "MIXED",
        description:
            "View the latest news and breaking news today for U.S., world, weather, entertainment, politics and health at CNN.com."),
  );

  _loadingData() {
    return Future<String>.delayed(const Duration(seconds: 2), () => 'Weee');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: _loadingData(),
      builder: (BuildContext ctx, AsyncSnapshot snap) {
        if (snap.data == null) {
          return const LoadingAnimationsPage();
        } else {
          return FullNewsPage(
            newsArticles: newsArticle,
          );
        }
      },
    );
  }
}

