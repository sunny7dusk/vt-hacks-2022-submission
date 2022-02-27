import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/page/full_news_page.dart';
import 'package:vt_hacks_submission/page/news_article.dart';
import 'package:vt_hacks_submission/search_result.dart';

class ChatboxComp extends StatelessWidget {
  ChatBox currChatBox;

  ChatboxComp({Key? key, required this.currChatBox}) : super(key: key);

  Color colorGenerator() {
    List<Color> ourColors = [
      const Color(0xffdd5e89),
      const Color(0xfff7bb97),
      const Color(0xff43cea2),
      const Color(0xff185a9d),
      const Color(0xffba5370),
      const Color(0xffb06ab3),
      const Color(0xff4568dc),
      const Color(0xff3a1c71),
      const Color(0xffd76d77),
      const Color(0xffffaf7b)
    ];
    return ourColors[Random().nextInt(ourColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          currChatBox.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          decoration: currChatBox.isHuman
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: const [
                      0.1,
                      0.9,
                    ],
                    colors: [colorGenerator(), colorGenerator()],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                )
              : const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.9,
                    ],
                    colors: [Color(0xffddd6f3), Color(0xfffaaca8)],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
          child: Column(
            children: [
              Text(currChatBox.text),
              if (currChatBox.isBot)
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullNewsPage(newsArticles: currChatBox.processed),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatBox {
  String text;
  bool isHuman;
  bool isBot;
  List<SearchResult> data;
  List<NewsArticle> processed;
  ChatBox(
      {this.text = "",
      required this.isHuman,
      required this.isBot,
      required this.data,
      required this.processed});
}
