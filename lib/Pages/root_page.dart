import 'package:flutter/material.dart';
import 'package:shop/Models/product.dart';

import 'package:shop/Pages/cart_page.dart';

import 'package:shop/Pages/favorite_page.dart';

import 'package:shop/Pages/home_page.dart';

import 'package:shop/Pages/profile_page.dart';

import 'package:shop/Pages/support_page.dart';

import 'package:shop/Constants/constant.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;
  List<Product> myCart = [];
  List<Product> productList = Product.productList;
  List<Widget> pages() {
    return [
      HomePage(),
      FavoritePage(),
      CartPage(cartList: myCart),
      const SupportPage(),
      const ProfilePage(),
    ];
  }

  String appBarTitle = 'هایپر ارگانو';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constants.descriptionColor,
              ),
              Text(
                appBarTitle,
                style: TextStyle(
                  color: Constants.descriptionColor,
                  fontFamily: 'iranSans',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: pages(),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: bottomIndex,
        onTabChange: (index) => setState(() {
          bottomIndex = index;

          List<Product> cartList = Product.shoppingCartMap.keys.toList();

          myCart = cartList;
          productList = Product.productList;
        }),
        style: GnavStyle.google,
        rippleColor: Colors.grey,
        backgroundColor: Colors.white,
        // haptic: true, // haptic feedback
        tabBorderRadius: 40,
        curve: Curves.easeOutExpo, // tab animation curves
        duration: const Duration(milliseconds: 500), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Constants.primaryColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Constants.primaryColor
            .withOpacity(0.1), // selected tab background color
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20), // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.info,
            text: 'Info',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
