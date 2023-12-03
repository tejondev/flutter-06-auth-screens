import 'package:auth_screens/config/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget suffixIcon;
  final bool? obscureText;
  final bool isValid;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
    required this.onChanged,
    required this.isValid,
    this.obscureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      style: const TextStyle(color: kGreyColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kGreyColor),
        fillColor: kTextFieldBgColor,
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
        // ENABLED BORDER ===================================
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: isValid ? kPrimaryColor : kTextFieldBorderColor,
                width: 2)),
        // FOCUSED BORDER ===================================
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: isValid ? kPrimaryColor : kGreyColor, width: 2)),
      ),
    );
  }
}
