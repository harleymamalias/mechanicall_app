import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            '-Or Sign In with-',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 17,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/google.png',
                  height: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 17,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/facebook.png',
                  height: 30,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
