import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/chatbot.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';
import 'package:lottie/lottie.dart';
import 'package:vt_hacks_submission/page/news_article.dart';
import 'package:vt_hacks_submission/source.dart';

class ChatPage extends StatefulWidget {
  final ChatBot chatBot;
  final String user;

  ChatPage({Key? key, required this.chatBot, required this.user})
      : super(key: key);

  @override
  State<ChatPage> createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  String _message = "";
  int index = 0;
  List<ChatBox> items = [];

  late final AnimationController _animationController;

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticIn,
  ));

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    super.initState();
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
          GestureDetector(
            onTap: () async {
              if (_message.isEmpty) return;
              _animationController.forward(from: 0.0);
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

              var listOfResults = value.results;
              List<NewsArticle> listOfArticles = [];

              listOfResults.forEach((element) async {
                Source currSource =
                    await Source.loadFromDomain(element.website);
                NewsArticle curr = NewsArticle(
                    title: element.title,
                    newsSource: element.website,
                    biasRating: currSource.bias,
                    credibilityRating: currSource.credibility,
                    factualReporting: currSource.factuality,
                    articleUrl: element.url);

                listOfArticles.add(curr);
              });
              ChatBox currRobot = ChatBox(
                  isHuman: false,
                  isBot: true,
                  text: "We've found results, click to have a look!",
                  data: value.results,
                  processed: listOfArticles);

              setState(() {
                items.add(currRobot);
                _message = "";
              });
            },
            child: Container(
              child: Lottie.network(
                  "https://assets8.lottiefiles.com/packages/lf20_ktlqec6m.json",
                  controller: _animationController,
                  onLoaded: (compo) =>
                      {_animationController.duration = compo.duration},
                  width: 200.0),
            ),
          ),
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
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
        ),
        _EntryBox()
      ]),
    );
  }
}
