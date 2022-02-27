import 'dart:math';

import 'package:flutter/material.dart';

class ChatboxComp extends StatelessWidget {
  ChatBox currChatBox;

  ChatboxComp({Key? key, required this.currChatBox}) : super(key: key);

  Color colorGenerator() {
    List<Color> ourColors = [
      Color(0xffdd5e89),
      Color(0xfff7bb97),
      Color(0xff43cea2),
      Color(0xff185a9d),
      Color(0xffba5370),
      Color(0xffb06ab3),
      Color(0xff4568dc),
      Color(0xff3a1c71),
      Color(0xffd76d77),
      Color(0xffffaf7b)
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
                    stops: [
                      0.1,
                      0.9,
                    ],
                    colors: [colorGenerator(), colorGenerator()],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                )
              : BoxDecoration(
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
                      // Navigator.push()
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded))
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
  ChatBox({
    this.text = "",
    required this.isHuman,
    required this.isBot,
  });
}
