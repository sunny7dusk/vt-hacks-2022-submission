import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vt_hacks_submission/components/chatbox_comp.dart';
import 'package:vt_hacks_submission/page/full_news_page.dart';
import 'package:vt_hacks_submission/page/loading_animation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _loadingData() {
    return Future<String>.delayed(const Duration(seconds: 2), () => 'Weee');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadingData(),
        builder: (BuildContext ctx, AsyncSnapshot snap) {
          if (snap.data == null) {
            return const LoadingAnimationsPage();
          } else {
            return FullNewsPage();
          }
        });
  }
}

// Scaffold(
//               backgroundColor: const Color(0xFF7A9BEE),
//               appBar: AppBar(
//                 title: const Text('info.friend'),
//                 centerTitle: true,
//                 backgroundColor: Colors.transparent,
//                 elevation: 0.0,
//               ),
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Stack(
//                       children: [
//                         Container(
//                           height: MediaQuery.of(ctx).size.height - 70.0,
//                           width: MediaQuery.of(ctx).size.width,
//                           color: Colors.transparent,
//                         ),
//                         Positioned(
//                           top: 20.0,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(45.0),
//                                 topRight: Radius.circular(45.0),
//                               ),
//                               color: Colors.white,
//                             ),
//                           ),
//                           height: MediaQuery.of(ctx).size.height,
//                           width: MediaQuery.of(ctx).size.width,
//                         ),
//                         Column(
//                           children: [
//                             Scrollbar(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   children: [
//                                     for (var i = 0; i < 100; i++)
//                                       Expanded(child: Text(i.toString()))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );