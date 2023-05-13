import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shop/Pages/root_page.dart';
import 'package:shop/Constants/constant.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  Future<Widget> animationFuture() {
    return Future.delayed(const Duration(seconds: 5))
        .then((value) => const RootPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent),
      // backgroundColor: Colors.redAccent,
      body: Center(
        child: FutureBuilder(
          future: animationFuture(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'هایپر اورگانو',
                        textStyle: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [
                          Constants.primaryColor,
                          Constants.secondaryColor
                        ],
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                  const SizedBox(height: 20),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'ارگانیک، بهترین راه برای اینکه جیبت رو خالی کنی',
                          speed: const Duration(milliseconds: 100),
                          textStyle: TextStyle(
                            color: Constants.primaryColor,
                            fontFamily: 'Vazir',
                          )),
                    ],
                    isRepeatingAnimation: false,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
