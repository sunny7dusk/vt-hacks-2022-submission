import 'package:flutter/material.dart';
import 'package:vt_hacks_submission/page/loading_animation_page.dart';
import 'package:vt_hacks_submission/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return Future<String>.delayed(const Duration(seconds: 5), () => 'Weee');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadingData(),
        builder: (BuildContext ctx, AsyncSnapshot snap) {
          if (snap.data == null) {
            return LoadingAnimationsPage();
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            );
          }
        });
  }
}
