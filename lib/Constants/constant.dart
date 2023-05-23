import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';

class Constants {
  static Color descriptionColor = Colors.grey;
  static Color titleColor = Colors.black;
  static Color primaryColor = const Color.fromARGB(255, 44, 102, 79);
  static Color secondaryColor = const Color.fromARGB(255, 255, 159, 41);
  static Color backgroundColor = const Color.fromARGB(255, 250, 243, 227);

  static String titleOne = 'ارزان تر از همه جا';
  static String descriptionOne =
      'با فروشگاه ما میتونی هر وسیله ای رو ارزون تر از همه جا پیدا کنی!';
  static String titleTwo = 'ارسال سریع';
  static String descriptionTwo =
      'با پردازش سریع، در حداقل زمان ممکن سفارشت رو تحویلت میدیم!';
  static int startOfProductId = 100;
  static const String adminUsername = 'Aerglo';
  static const String aminPassword = '13820623n';
  static const String adminEmail = 'imaerglo@gmail.com';
  static bool isLoggedIn = false;
  static bool isFirstTime = false;
  static String boxName = 'userBox';
  static List<Product> getMostSale() {
    List<Product> mostSale = Product.productList;
    mostSale.sort((a, b) => b.sellCounts.compareTo(a.sellCounts));
    return mostSale;
  }

  static List<Product> mostSale = getMostSale();
  static List<Product> favoriteList = Product.getFavouriteProducts();
}
