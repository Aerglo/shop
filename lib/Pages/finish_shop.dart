import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Models/user.dart';
import 'package:shop/Pages/root_page.dart';

class FinishShop extends StatefulWidget {
  const FinishShop({super.key});

  @override
  State<FinishShop> createState() => _FinishShopState();
}

class _FinishShopState extends State<FinishShop> {
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: Row(
                  children: [
                    Radio(
                      activeColor: Constants.primaryColor,
                      groupValue: _selectedValue,
                      value: 0,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    const Text(
                      'پرداخت به صورت آنلاین',
                      style: TextStyle(fontFamily: 'Vazir'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: Row(
                  children: [
                    Radio(
                      activeColor: Constants.primaryColor,
                      groupValue: _selectedValue,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                    const Text(
                      'پرداخت به صورت حضوری',
                      style: TextStyle(fontFamily: 'Vazir'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.3),
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'در صورت ثبت سفارش، محصول شما نهایتا در سه تا پنج روز کاری به دست شما خواهد رسید.',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        content: _selectedValue == 0
                            ? const Text(
                                'از پرداخت شما متشکریم:)',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontFamily: 'Vazir'),
                              )
                            : const Text(
                                'سفارش شما ثبت شد، بزودی شما را ملاقات خواهیم کرد:)',
                                textDirection: TextDirection.rtl,
                              ),
                      ),
                    );
                    setState(() {
                      Product.shoppingCartMap = {};
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RootPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(fontFamily: 'Vazir', color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
