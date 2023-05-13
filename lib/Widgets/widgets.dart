import 'package:flutter/material.dart';
import 'package:shop/Pages/animation_page.dart';
import 'package:shop/Pages/root_page.dart';
import 'package:shop/Constants/constant.dart';
import 'package:page_transition/page_transition.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: InkResponse(
        onTap: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: const RootPage(),
              type: PageTransitionType.leftToRight,
            ),
          );
        },
        child: Text(
          'رد کردن',
          style: TextStyle(
            color: Constants.titleColor,
          ),
        ),
      ),
    );
  }
}

class CarouselBase extends StatelessWidget {
  final String imageAsset, description, title;
  const CarouselBase({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, bottom: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 350,
          //   child: Image.asset(imageAsset),
          // ),
          const SizedBox(height: 20),
          CarouselTitleText(title: title),
          const SizedBox(height: 20),
          CaouselDescriptionText(description: description),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CaouselDescriptionText extends StatelessWidget {
  const CaouselDescriptionText({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Constants.descriptionColor,
        fontFamily: 'iranSans',
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}

class CarouselTitleText extends StatelessWidget {
  const CarouselTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Constants.titleColor,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }
}

Widget indicator(bool isActived) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    height: 10.0,
    width: isActived ? 20.0 : 8.0,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: Constants.primaryColor,
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.currentIndex,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      bottom: 60,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Constants.primaryColor,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 25.0,
            color: Colors.white,
          ),
          onPressed: () {
            if (currentIndex == 0) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AnimationPage()),
              );
            }
          },
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          textAlign: TextAlign.start,
          showCursor: false,
          decoration: InputDecoration(
            hintText: 'جستجو...',
            contentPadding: EdgeInsets.only(right: 5.0),
            hintStyle: TextStyle(
              fontFamily: 'iranSans',
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          style: TextStyle(
            fontFamily: 'Yekan',
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }
}
