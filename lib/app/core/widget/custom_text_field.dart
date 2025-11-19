import 'package:flutter/material.dart';

class CustomUnderlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? onSuffixTap;  // <-- ADD THIS

  const CustomUnderlinedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onSuffixTap,  // <-- ADD THIS
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: onSuffixTap,      // <-- WORKING
          child: Icon(
            suffixIcon,
            color: Colors.white,
          ),
        )
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

