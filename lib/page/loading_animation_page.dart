import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationsPage extends StatelessWidget {
  const LoadingAnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets6.lottiefiles.com/packages/lf20_qmfs6c3i.json"),
      ),
    );
  }
}
