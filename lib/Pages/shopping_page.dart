import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Pages/finish_shop.dart';
import 'package:shop/Pages/login_page.dart';
import 'package:shop/Constants/constant.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int countingThePrice(Map<Product, int> shoppingCartMap) {
    List<Product> product = shoppingCartMap.keys.toList();
    List<int> numbers = shoppingCartMap.values.toList();
    int sum = 0;
    for (int i = 0; i < shoppingCartMap.length; i++) {
      sum += product[i].price * numbers[i];
    }
    return sum;
  }

  bool onlinePayment = true;
  bool presentPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: Product.shoppingCartMap.length,
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.primaryColor.withOpacity(0.8),
                    ),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 64) * 0.6,
                          child: Text(
                            Product.shoppingCartMap.keys.toList()[index].name,
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: 'Vazir',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 64) * 0.2,
                          child: Text(
                            '${Product.shoppingCartMap.values.toList()[index]} عدد',
                            style: const TextStyle(
                              fontFamily: 'Vazir',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            (Product.shoppingCartMap.keys
                                        .toList()[index]
                                        .price *
                                    Product.shoppingCartMap.values
                                        .toList()[index])
                                .toString(),
                            style: const TextStyle(
                              fontFamily: 'Vazir',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 5,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 32,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'جمع کل',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Vazir',
                            ),
                          ),
                          Text(
                            countingThePrice(Product.shoppingCartMap)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Vazir',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          if (Constants.isLoggedIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FinishShop(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'تایید و اتمام خرید',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Vazir',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
