import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/payments/payment_loading_page.dart';

class PaymentSuccessfulMessage extends StatelessWidget {
  const PaymentSuccessfulMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentLoadingPage(), 
          ),
        );
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xffA4243B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 10,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        child: Text(
          'PAY',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
