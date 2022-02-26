import 'package:flutter/material.dart';

class ChatboxComp extends StatelessWidget {
  const ChatboxComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.9,
            ],
            colors: [
              Color.fromARGB(255, 137, 147, 202),
              Color.fromARGB(255, 164, 231, 225),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )),
      child: Text("Hello\n VT\n Hacks"),
    );
  }
}

class ChatBox {
  String chatText;
  ChatBox({this.chatText = ""});
}
