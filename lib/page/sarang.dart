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

class _FullNewsPageState extends State<ChatPage> {
  String _message = "";
  int index = 0;
  List<ChatBox> items = [];

  _EntryBox() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.white,
        height: 70.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration.collapsed(
                  hintText: "Ask a question about current news ..."),
              onChanged: (val) => {_message = val},
            )),
            IconButton(
                onPressed: () {
                  // do api call to bot
                  bool botOrHuman = index % 2 == 0;
                  ChatBox curr = ChatBox(
                      isHuman: botOrHuman, isBot: !botOrHuman, text: _message);
                  // if (!botOrHuman) {
                  //   widget.chatBot.query(_message).then((value) => null);
                  // } else {

                  // }
                  setState(() {
                    items.add(curr);
                  });
                },
                iconSize: 25.0,
                icon: Icon(Icons
                    .send), //Lottie.network(                    "https://lottiefiles.com/52054-sending-confirmation.json"),
                color: Colors.blue)
          ],
        ));
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
