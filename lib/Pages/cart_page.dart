import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Pages/product_page.dart';
import 'package:shop/Pages/shopping_page.dart';
import 'package:shop/Constants/constant.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartList;
  const CartPage({super.key, required this.cartList});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.cartList.isEmpty
          ? Center(
              child: Text(
                'سبد خریدت خالیه که:(',
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
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: widget.cartList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              product: widget.cartList[index],
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
                              height: 110,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      widget.cartList[index].imageAsset!,
                                    ),
                                  ),
                                  // const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        child: Text(
                                          widget.cartList[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'Vazir'),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Container(
                                              // width: 10,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Product.shoppingCartMap[
                                                            widget.cartList[
                                                                index]] =
                                                        Product.shoppingCartMap[
                                                                widget.cartList[
                                                                    index]]! +
                                                            1;
                                                  });
                                                },
                                                icon: const Icon(Icons.add),
                                              ),
                                            ),
                                            Text(Product.shoppingCartMap[
                                                    widget.cartList[index]]
                                                .toString()),
                                            Container(
                                              // width: 10,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Product.shoppingCartMap[
                                                            widget.cartList[
                                                                index]] =
                                                        Product.shoppingCartMap[
                                                                widget.cartList[
                                                                    index]]! -
                                                            1;
                                                    if (Product.shoppingCartMap[
                                                            widget.cartList[
                                                                index]] ==
                                                        0) {
                                                      widget.cartList[index]
                                                          .isSelected = false;
                                                      for (int i = 0;
                                                          i <
                                                              Product
                                                                  .productList
                                                                  .length;
                                                          i++) {
                                                        if (widget
                                                                .cartList[index]
                                                                .productId ==
                                                            Product
                                                                .productList[i]
                                                                .productId) {
                                                          Product.productList[i]
                                                                  .isSelected =
                                                              false;
                                                        }
                                                      }
                                                      Product.shoppingCartMap
                                                          .remove(widget
                                                              .cartList[index]);
                                                      widget.cartList
                                                          .removeAt(index);
                                                    }
                                                  });
                                                },
                                                icon: const Icon(Icons.remove),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: (MediaQuery.of(context).size.width -
                                            32) *
                                        0.2,
                                  ),
                                  Text(
                                    '${widget.cartList[index].price} تومان',
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
                  Positioned(
                    bottom: 5,
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const ShoppingPage(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: const Text(
                          'ادامه خرید',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Vazir',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
