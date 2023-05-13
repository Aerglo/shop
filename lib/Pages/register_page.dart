import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/user.dart';
import 'package:shop/Pages/login_page.dart';
import 'package:shop/Pages/shopping_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  void State() async {
    Constants.isLoggedIn = true;
    var box = await Hive.openBox<User>(Constants.boxName);
    User.usersList = box.values.toList();
    User.usersList.add(
      User()
        ..username = _usernameController.text
        ..password = _passwordController.text
        ..email = _emailController.text,
    );
    User.currentUsername = _usernameController.text;
    box.add(
      User()
        ..username = _usernameController.text
        ..password = _passwordController.text
        ..email = _emailController.text,
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null) {
                    return 'نام کاربری نمی‌تواند خالی باشد';
                  } else {
                    if (value.isEmpty) {
                      return 'نام کاربری نمی‌تواند خالی باشد';
                    } else {
                      for (User user in User.usersList) {
                        if (user.username == value) {
                          return 'نام کاربریت قبلا انتخاب شده';
                        }
                      }
                      return null;
                    }
                  }
                },
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  hintText: 'نام کاربری',
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(fontFamily: 'Vazir'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _emailController,
                validator: (String? value) {
                  if (value == null) {
                    return 'ایمیل نمی‌تواند خالی باشد';
                  } else {
                    if (RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return 'ساختار ایمیلت اشتباهه';
                    }
                  }
                },
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  hintText: 'ایمیل',
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(fontFamily: 'Vazir'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _passwordController,
                validator: (String? value) {
                  if (value == null) {
                    return 'رمز عبور نمی‌تواند خالی باشد';
                  } else {
                    if (value.length < 8) {
                      return 'حداقل طول رمز عبور 8 رقم است';
                    } else {
                      return null;
                    }
                  }
                },
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  hintText: 'رمز ورود',
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(fontFamily: 'Vazir'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () => const LoginPage(),
                child: const Text(
                  'اکانت داری؟؟؟\nوارد شو!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    color: Color.fromARGB(255, 4, 93, 166),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Constants.primaryColor,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 5),
                        duration: const Duration(seconds: 3),
                        content: const Text(
                          'خوش آمدید',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontFamily: 'Vazir'),
                        ),
                      ),
                    );

                    setState(() {
                      State();
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'ثبت نام',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Vazir',
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
