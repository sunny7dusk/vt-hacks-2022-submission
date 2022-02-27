import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<ChatPage> {
  String _message = "";

  _EntryBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.white,
        height: 70.0,
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration.collapsed(hintText: "Ask a question ..."),
              onChanged: (val) => {_message = val},
            )),
            IconButton(
                onPressed: () {
                  // do api call to bot
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
    List<ChatBox> items =
        List<ChatBox>.generate(50, (i) => ChatBox(chatText: 'Item $i'));
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ), // Gets clipped
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 45.0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ChatboxComp(items[index], false);
                  }),
            ),
          ),
        ),
        _EntryBox()
      ]),
    );
  }
}
