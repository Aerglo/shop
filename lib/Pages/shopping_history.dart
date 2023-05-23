import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Models/user.dart';
import 'package:shop/Pages/factor.dart';

class ShoppingHistory extends StatefulWidget {
  const ShoppingHistory({super.key});

  @override
  State<ShoppingHistory> createState() => _ShoppingHistoryState();
}

class _ShoppingHistoryState extends State<ShoppingHistory> {
  Map<DateTime, Map<Product, int>> shoppingHistory = {};
  void setShoppingHistory() {
    List<User> userList = Hive.box<User>(Constants.boxName).values.toList();
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].username == User.currentUsername) {
        shoppingHistory = userList[i].shoppingHistory;
      }
    }
  }

  @override
  void initState() {
    setShoppingHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shoppingHistory.isEmpty
          ? Center(
              child: Text(
                'تا حالا هیچ خرید موفقی نداشتی:(',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Constants.primaryColor, fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: shoppingHistory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Factor(
                            shoppingFactor:
                                shoppingHistory.values.toList()[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          DateTime(
                            shoppingHistory.keys.toList()[index].year,
                            shoppingHistory.keys.toList()[index].month,
                            shoppingHistory.keys.toList()[index].day,
                            shoppingHistory.keys.toList()[index].hour,
                            shoppingHistory.keys.toList()[index].minute,
                          ).toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
