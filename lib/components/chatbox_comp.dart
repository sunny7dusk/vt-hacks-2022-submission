import 'package:flutter/material.dart';

class ChatboxComp extends StatelessWidget {
  final ChatBox item;
//  final EdgeInsets myMargin;
  final bool myMessage;
  ChatboxComp(this.item, this.myMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.myMessage
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
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
            topLeft: myMessage ? Radius.circular(15.0) : Radius.zero,
            bottomLeft: myMessage ? Radius.circular(15.0) : Radius.zero,
            topRight: !myMessage ? Radius.circular(15.0) : Radius.zero,
            bottomRight: !myMessage ? Radius.circular(15.0) : Radius.zero,
          )),
      child: Text(item.chatText),
    );
  }
}

class ChatBox {
  String chatText;
  ChatBox({this.chatText = ""});
}
