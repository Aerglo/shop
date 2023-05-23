import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'آدرس شعب',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'دفتر تهران : میرداماد ، میدان مادر ، ابن سینا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '44836907 -021',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'تلفن پیگیری و سفارشات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '03132621709',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'شعبه اول : اصفهان، خیابان هزارجریب، مقابل در شرقی دانشگاه اصفهان',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'شعبه دوم : اصفهان، خیابان نظرغربی، بعد از خواجه پطرس',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'شعبه سوم : اصفهان، خیابان علامه امینی شرقی، مقابل باغ غدیر، نبش کوچه 11',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'راه های ارتباط با ما',
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Instagrame.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'hyperoragno',
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Twitter.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'hyperoragno',
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
