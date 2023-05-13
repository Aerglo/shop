import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'تماس با ما',
        style: TextStyle(
          fontFamily: 'Vazir',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
