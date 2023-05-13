import 'package:flutter/material.dart';
import 'package:shop/Constants/constant.dart';
import 'package:shop/Models/user.dart';
import 'package:shop/Pages/shopping_history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Constants.isLoggedIn
          ? Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Constants.primaryColor.withOpacity(0.2),
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Welcome ${User.currentUsername}!',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Constants.isLoggedIn = false;
                          User.currentUsername = '';
                        });
                      },
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Constants.primaryColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              'خروج از حساب کاربری',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontFamily: 'Vazir',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'اکانتی ساخته نشده!',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 20,
                  color: Constants.primaryColor,
                ),
              ),
            ),
    );
  }
}
