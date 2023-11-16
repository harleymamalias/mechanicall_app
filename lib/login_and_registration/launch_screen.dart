import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanicall_app/login_and_registration/user_login_page.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(UserLoginPage());
    });
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      body: Center(
        child: Image.asset("assets/images/launch-screen.png"),
      ),
    );
  }
}
