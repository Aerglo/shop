import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Pages/product_page.dart';
import 'package:shop/Constants/constant.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Constants.favoriteList.isEmpty
          ? Center(
              child: Text(
                'ظاهرا به هیچی علاقه نداشتی:-|',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontFamily: 'Vazir',
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: Constants.favoriteList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                          product: Constants.favoriteList[index],
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 32) *
                                        0.1,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < Product.productList.length;
                                          i++) {
                                        if (Constants.favoriteList[index]
                                                .productId ==
                                            Product.productList[i].productId) {
                                          Product.productList[i].isFavourited =
                                              false;
                                        }
                                      }
                                      Constants.favoriteList.removeAt(index);
                                      Constants.favoriteList =
                                          Product.getFavouriteProducts();
                                      Constants.mostSale =
                                          Constants.getMostSale();
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ),
                              SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width - 32) *
                                        0.2,
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 32) *
                                        0.1,
                                child: Image.asset(
                                  Constants.favoriteList[index].imageAsset!,
                                ),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 32) *
                                        0.4,
                                child: Text(
                                  Constants.favoriteList[index].name,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontFamily: 'Vazir'),
                                ),
                              ),
                              SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width - 32) *
                                        0.2,
                              ),
                              Text(
                                '${Constants.favoriteList[index].price} تومان',
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Vazir',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
