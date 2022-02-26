import 'package:flutter/material.dart';

class FullNewsPage extends StatelessWidget {
  const FullNewsPage({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height - 60,
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (var i = 0; i < 100; i++) Text(i.toString())
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
