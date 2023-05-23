import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/product.dart';
import 'package:shop/Models/user.dart';

import 'package:shop/Pages/root_page.dart';

import 'package:shop/Pages/splash_screen.dart';

import 'package:shop/Pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductAdapter());
  var box = await Hive.openBox<User>(Constants.boxName);
  User.usersList = box.values.toList();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        'FirstPageCarousel': (context) => const FirstPageCarousel(),
        'LoginPage': (context) => const LoginPage(),
        'RootPage': (context) => const RootPage(),
      },
      initialRoute: 'FirstPageCarousel',
    );
  }
}
