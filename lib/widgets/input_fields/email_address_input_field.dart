import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    Key? key,
    required this.controller,
    required this.textPlaceHolder,
    required this.textInputType
  }) : super(key: key);

  final TextEditingController controller;
  final String textPlaceHolder;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 15),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: textPlaceHolder,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 14,
              height: 1,
            ),
          ),
        ),
        //for validation purposes
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter a valid email address';
        //   }
        //   return null;
        // },
      ),
    );
  }
}