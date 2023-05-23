import 'package:flutter/material.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/product.dart';

class Factor extends StatelessWidget {
  final Map<Product, int> shoppingFactor;
  const Factor({super.key, required this.shoppingFactor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
        child: ListView.builder(
          itemCount: shoppingFactor.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${shoppingFactor.values.toList()[index]} عدد',
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      shoppingFactor.keys.toList()[index].name,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
