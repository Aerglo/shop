import 'package:flutter/material.dart';

import 'package:shop/Widgets/widgets.dart';

import 'package:shop/Constants/constant.dart';

class FirstPageCarousel extends StatefulWidget {
  const FirstPageCarousel({super.key});

  @override
  State<FirstPageCarousel> createState() => _FirstPageCarouselState();
}

class _FirstPageCarouselState extends State<FirstPageCarousel> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _indicator() {
    List<Widget> buildIndicator = [];
    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        buildIndicator.add(indicator(true));
      } else {
        buildIndicator.add(indicator(false));
      }
    }
    return buildIndicator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0,
        actions: const [
          SkipButton(),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              CarouselBase(
                imageAsset: 'assets/imae/png1.png',
                description: Constants.descriptionOne,
                title: Constants.titleOne,
              ),
              CarouselBase(
                imageAsset: 'assets/imae/png2.png',
                description: Constants.descriptionTwo,
                title: Constants.titleTwo,
              ),
            ],
          ),
          Positioned(
            left: 30,
            bottom: 80,
            child: Row(
              children: _indicator(),
            ),
          ),
          ArrowButton(
            currentIndex: currentIndex,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
