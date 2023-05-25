import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Pages/category_page.dart';
import 'package:shop/Pages/product_page.dart';
import 'package:shop/Constants/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryList = [
    'روغن',
    'لبنیات',
    'حبوبات',
    'پروتئین',
    'عسل',
    'نان',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(18),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width - 32,
              child: Image.asset('assets/images/hyperorgano-logo.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    margin: const EdgeInsets.only(
                      top: 2.0,
                      left: 4.0,
                      bottom: 20.0,
                      right: 4.0,
                    ),
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border(
                        left: BorderSide(color: Colors.black.withOpacity(0.4)),
                        right: BorderSide(color: Colors.black.withOpacity(0.4)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.4)),
                        top: BorderSide(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: CategoryPage(
                                category: categoryList[index],
                              ),
                              type: PageTransitionType.fade,
                            ),
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categoryList[index],
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontFamily: 'Vazir',
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width,
              child: Text(
                'پر فروش های هفته',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'iranSans',
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColor,
                  fontSize: 22.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              height: 250,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: ProductPage(
                            product: Constants.mostSale[index],
                          ),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12.0,
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16.0,
                            ),
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                            ),
                          ),
                          Positioned(
                            left: 60,
                            top: 20,
                            child: Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                Constants.mostSale[index].imageAsset!,
                                height: 100,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 130,
                            right: 30,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 4.0, left: 12.0),
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2 -
                                      30,
                              child: Text(
                                Constants.mostSale[index].name,
                                textDirection: TextDirection.rtl,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Vazir',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            right: 30,
                            child: Text(
                              '${Constants.mostSale[index].price} تومان',
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Vazir',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 30,
                            child: IconButton(
                              icon: Constants.mostSale[index].isFavourited
                                  ? Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Constants.primaryColor,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                      color: Constants.primaryColor,
                                    ),
                              onPressed: () {
                                setState(() {
                                  Constants.mostSale[index].isFavourited =
                                      !Constants.mostSale[index].isFavourited;
                                  for (int i = 0;
                                      i < Product.productList.length;
                                      i++) {
                                    if (Product.productList[i].productId ==
                                        Constants.mostSale[index].productId) {
                                      Product.productList[i].isFavourited =
                                          Constants
                                              .mostSale[index].isFavourited;
                                    }
                                  }
                                  Constants.favoriteList =
                                      Product.getFavouriteProducts();
                                  Constants.mostSale = Constants.getMostSale();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
