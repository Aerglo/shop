import 'package:hive/hive.dart';
import 'package:shop/Models/product.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String password;
  @HiveField(2)
  late String email;
  @HiveField(3)
  Map<DateTime, Map<Product, int>> shoppingHistory = {};
  static String currentUsername = 'Aerglo';
  static List<User> usersList = [];
}
