import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/page/news_article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';

class FullNewsPage extends StatelessWidget {
  FullNewsPage({Key? key, required this.newsArticles}) : super(key: key);

  List<NewsArticle> newsArticles;

  @override
  Widget build(BuildContext context) {
    List<ChatBox> items =
        List<ChatBox>.generate(50, (i) => ChatBox(chatText: 'Item $i'));

    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      appBar: AppBar(
        title: const Text(
          'Results',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
                  height: MediaQuery.of(context).size.height - 60,
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (var i in newsArticles)
                            Card(
                              margin: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 2.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        i.title,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(i.description),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Text(i.newsSource),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: i.getBiasRating(),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: i.getCredibilityRating(),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(i.factualReporting),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await launch(i.articleUrl);
                                            },
                                            child: const Text("ARTICLE"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Hello word'))
          ],
        ),
      ),
    );
  }
}
