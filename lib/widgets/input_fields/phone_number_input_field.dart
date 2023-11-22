import 'package:flutter/material.dart';

class PhoneNumberInputField extends StatelessWidget {
  const PhoneNumberInputField({
    Key? key,
    required this.controller,
    required this.textPlaceHolder,
    required this.textInputType,
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
          hintStyle: const TextStyle(
            fontSize: 14,
            height: 1,
          ),
        ),
      ),
    );
  }
}
