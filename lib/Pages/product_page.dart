import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Pages/root_page.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor.withOpacity(0.2),
                      ),
                      child: IconButton(
                        icon: widget.product.isSelected
                            ? Icon(
                                Icons.check,
                                color: Constants.primaryColor,
                              )
                            : Icon(
                                Icons.shopping_cart_outlined,
                                color: Constants.primaryColor,
                              ),
                        onPressed: () {
                          setState(() {
                            widget.product.isSelected =
                                !widget.product.isSelected;
                            for (int i = 0;
                                i < Product.productList.length;
                                i++) {
                              if (widget.product.productId ==
                                  Product.productList[i].productId) {
                                Product.productList[i].isSelected =
                                    widget.product.isSelected;
                              }
                            }
                            Product.shoppingCartMap.addAll({widget.product: 1});
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor.withOpacity(0.2),
                      ),
                      child: IconButton(
                        icon: Icon(
                          widget.product.isFavourited
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Constants.primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.product.isFavourited =
                                !widget.product.isFavourited;
                            for (int i = 0;
                                i < Product.productList.length;
                                i++) {
                              if (widget.product.productId ==
                                  Product.productList[i].productId) {
                                Product.productList[i].isFavourited =
                                    widget.product.isFavourited;
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
              Center(
                child: SizedBox(
                  height: 300,
                  child: Image.asset(widget.product.imageAsset!),
                ),
              ),
              Center(
                child: Text(
                  widget.product.name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                '${widget.product.price} تومان',
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Vazir',
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 300,
                  child: ListView.builder(
                    itemCount: widget.product.description.length,
                    itemBuilder: (context, index) {
                      if (widget.product.description.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.check),
                                const SizedBox(width: 8),
                                Text(
                                  widget.product.description[index],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Vazir',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
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
