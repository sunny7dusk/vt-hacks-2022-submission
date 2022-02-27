import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/chatbot.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';
import 'package:lottie/lottie.dart';
import 'package:vt_hacks_submission/page/news_article.dart';

class ChatPage extends StatefulWidget {
  final ChatBot chatBot;

  ChatPage({Key? key, required this.chatBot}) : super(key: key);

  @override
  State<ChatPage> createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  String _message = "";
  int index = 0;
  List<ChatBox> items = [];

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _animationController.dispose();
  }

  _EntryBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration.collapsed(
                  hintText: "Ask a question about current news ..."),
              onChanged: (val) => {_message = val},
            ),
          ),
          SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () async {
                _animationController.forward();
                if (_message.isEmpty) return;
                ChatBox currHuman = ChatBox(
                    isHuman: true,
                    isBot: false,
                    text: _message,
                    data: [],
                    processed: []);
                setState(() {
                  items.add(currHuman);
                });
                _textEditingController.clear();

                var value = await widget.chatBot.query(_message);

                setState(() {
                  var listOfResults = value.results;
                  List<NewsArticle> listOfArticles = [];

                  listOfResults.forEach((element) {
                    NewsArticle curr = NewsArticle(
                        title: element.title,
                        newsSource: element.website,
                        biasRating: "0",
                        credibilityRating: "0",
                        factualReporting: "0");

                    listOfArticles.add(curr);
                  });
                  ChatBox currRobot = ChatBox(
                      isHuman: false,
                      isBot: true,
                      text: "We've found results, click to have a look!",
                      data: value.results,
                      processed: listOfArticles);
                  items.add(currRobot);
                  _message = "";
                  _animationController.reset();
                });
              },
              child: Container(
                child: Lottie.network(
                  "https://assets6.lottiefiles.com/packages/lf20_r4alsuls.json",
                  controller: _animationController,
                ),
              ),
            ),
          )
          // IconButton(
          //     onPressed: () {
          //       // do api call to bot
          // ChatBox currHuman = ChatBox(
          //     isHuman: true,
          //     isBot: false,
          //     text: _message,
          //     data: [],
          //     processed: []);
          // setState(() {
          //   items.add(currHuman);
          // });
          // _textEditingController.clear();

          // widget.chatBot.query(_message).then((value) => {
          //       setState(() {
          //         var listOfResults = value.results;
          //         List<NewsArticle> listOfArticles = [];

          //         listOfResults.forEach((element) {
          //           NewsArticle curr = NewsArticle(
          //               title: element.title,
          //               newsSource: element.website,
          //               biasRating: "0",
          //               credibilityRating: "0",
          //               factualReporting: "0");

          //           listOfArticles.add(curr);
          //         });
          //         ChatBox currRobot = ChatBox(
          //             isHuman: false,
          //             isBot: true,
          //             text:
          //                 "We've found results, click to have a look!",
          //             data: value.results,
          //             processed: listOfArticles);
          //         items.add(currRobot);
          //         _message = "";
          //       })
          //     });
          //     },
          //     iconSize: 25.0,
          //     icon: Icon(Icons
          //         .send), //Lottie.network(                    "https://lottiefiles.com/52054-sending-confirmation.json"),
          //     color: Colors.blue)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      appBar: AppBar(
        title: const Text('info.friend'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ), // Gets clipped
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 45.0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ChatboxComp(
                      currChatBox: items[index],
                    );
                  }),
            ),
          ),
        ),
        _EntryBox()
      ]),
    );
  }
}
