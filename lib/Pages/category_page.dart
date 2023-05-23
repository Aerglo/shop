import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Pages/product_page.dart';
import 'package:shop/Constants/constant.dart';
import 'package:page_transition/page_transition.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String appBarTitle = 'هایپر ارگانو';

  @override
  Widget build(BuildContext context) {
    List<Product> productList = Product.productList
        .where((element) => element.category == widget.category)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: productList.length ~/ 2,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: ProductPage(
                        product: productList[index * 2],
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
                            productList[index * 2].imageAsset!,
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 30,
                        child: Container(
                          margin: const EdgeInsets.only(right: 4.0, left: 12.0),
                          width:
                              (MediaQuery.of(context).size.width - 64) / 2 - 40,
                          child: Text(
                            productList[index * 2].name,
                            textDirection: TextDirection.rtl,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Vazir',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        right: ((MediaQuery.of(context).size.width - 64) / 2) *
                            0.3,
                        child: Text(
                          '${productList[index * 2].price} تومان',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
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
                          icon: productList[index * 2].isFavourited
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
                              productList[index * 2].isFavourited =
                                  !productList[index * 2].isFavourited;
                              for (int i = 0;
                                  i < Product.productList.length;
                                  i++) {
                                if (Product.productList[i].productId ==
                                    productList[index * 2].productId) {
                                  Product.productList[i].isFavourited =
                                      productList[index * 2].isFavourited;
                                }
                              }
                              Constants.favoriteList =
                                  Product.getFavouriteProducts();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ProductPage(
                          product: productList[index * 2 + 1],
                        ),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
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
                            productList[index * 2 + 1].imageAsset!,
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 30,
                        child: Container(
                          margin: const EdgeInsets.only(right: 4.0, left: 12.0),
                          width:
                              (MediaQuery.of(context).size.width - 64) / 2 - 30,
                          child: Text(
                            productList[index * 2 + 1].name,
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
                        right: ((MediaQuery.of(context).size.width - 64) / 2) *
                            0.3,
                        child: Text(
                          '${productList[index * 2 + 1].price} تومان',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Vazir',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 30,
                        child: IconButton(
                          icon: productList[index * 2 + 1].isFavourited
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
                              productList[index * 2 + 1].isFavourited =
                                  !productList[index * 2 + 1].isFavourited;
                              for (int i = 0;
                                  i < Product.productList.length;
                                  i++) {
                                if (Product.productList[i].productId ==
                                    productList[index * 2 + 1].productId) {
                                  Product.productList[i].isFavourited =
                                      productList[index * 2 + 1].isFavourited;
                                }
                              }
                              Constants.favoriteList =
                                  Product.getFavouriteProducts();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
