import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/payments/payment_confirmed_page.dart';

class PaymentLoadingPage extends StatelessWidget {
  const PaymentLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.to(() => PaymentConfirmed());
    });
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffD8973C)),
            ),
            const SizedBox(height: 20),
            Text(
              'Processing your payment, please wait.',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
