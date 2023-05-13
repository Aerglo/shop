import 'package:flutter/material.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/user.dart';
import 'package:shop/Pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  'هنوز اکانت نساختی؟؟\nاز اینجا بساز',
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
                  bool flag = false;
                  if (_formKey.currentState!.validate()) {
                    for (User user in User.usersList) {
                      if (user.username == _usernameController.text &&
                          user.password == _passwordController.text) {
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
                        Navigator.pop(context);

                        setState(() {
                          flag = true;
                          Constants.isLoggedIn = true;
                          User.currentUsername = _usernameController.text;
                        });
                      }
                    }
                    if (!flag) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          showCloseIcon: true,
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 3),
                          margin: const EdgeInsets.only(bottom: 5),
                          content: const Text(
                            'نام کاربری یا رمز عبور شما اشتباه است',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: 'Vazir'),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  'ورود',
                  style: TextStyle(color: Colors.white, fontFamily: 'Vazir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
