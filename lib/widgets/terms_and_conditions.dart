import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsAndPrivacyPolicy extends StatelessWidget {
  const TermsAndConditionsAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      appBar: AppBar( 
        backgroundColor: const Color(0xffD8973C),
        centerTitle: true,
        title: Text(
          'Terms and Conditions',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: termsAndConditionsAndPrivacyPolicy.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      termsAndConditionsAndPrivacyPolicy[index],
                      style: GoogleFonts.inter(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      strutStyle: const StrutStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA4243B),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'I Agree',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> termsAndConditionsAndPrivacyPolicy = [
  "1. Introduction\nWelcome to MechaniCALL! These terms and conditions outline the rules and regulations for the use of MechaniCALL's Website and Mobile Application.",
  "2. Acceptance of Terms\nBy accessing this website and using our mobile application, we assume you accept these terms and conditions. Do not continue to use MechaniCALL if you do not agree to all of the terms and conditions stated on this page.",
  "3. License to Use\nMechaniCALL and its licensors own the intellectual property rights for all material on MechaniCALL. All intellectual property rights are reserved. You may view and/or print pages from https://www.MechaniCALL.com for your own personal use, subject to restrictions set in these terms and conditions.",
  "4. Restrictions\nYou must not:\n- Republish material from MechaniCALL.\n- Sell, rent, or sub-license material from MechaniCALL.\n- Reproduce, duplicate, or copy material from MechaniCALL.",
  "5. Privacy Policy\nYour privacy is important to us. Our Privacy Policy, which also governs your visit to our website and use of our mobile application, can be found here. Please review our Privacy Policy to understand our practices.",
  "6. Change of Use\nMechaniCALL reserves the right to:\n- Change or remove (temporarily or permanently) the website or any part of it without notice.\n- Change these terms and conditions at any time, and your continued use of the website following any changes shall be deemed to be your acceptance of such change.",
  "7. Governing Law\nThese terms and conditions are governed by and construed in accordance with the laws of the Philippines and you irrevocably submit to the exclusive jurisdiction of the courts in that location.",
  "8. Contact Information\nIf you have any questions about these terms and conditions, please contact us at contact@MechaniCALL.com.",
];
