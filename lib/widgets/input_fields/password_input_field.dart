import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.textPlaceHolder,
    required this.textInputType,
  }) : super(key: key);

  final TextEditingController controller;
  final String textPlaceHolder;
  final TextInputType textInputType;

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: widget.textPlaceHolder,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                hintStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ],
      ),
    );
  }
}
