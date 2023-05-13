import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Models/user.dart';

class ShoppingHistory extends StatelessWidget {
  const ShoppingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    late Map<DateTime, List<Product>> shoppingHistoryMap;
    for (User user in User.usersList) {
      if (user.username == User.currentUsername) {
        shoppingHistoryMap = user.shoppingHistory;
      }
    }
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: shoppingHistoryMap.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(shoppingHistoryMap.keys.toList()[index].toString()),
                ListView.builder(
                  itemCount: shoppingHistoryMap.values.toList()[index].length,
                  itemBuilder: (context, index2) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(shoppingHistoryMap.values
                          .toList()[index][index2]
                          .name),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
