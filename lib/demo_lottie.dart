import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DemoLottie extends StatefulWidget {
  const DemoLottie({super.key});

  @override
  State<DemoLottie> createState() => _DemoLottieState();
}

class _DemoLottieState extends State<DemoLottie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Lottie.asset("assets/lottie/Animation - 1726742651273.json")));
  }
}
