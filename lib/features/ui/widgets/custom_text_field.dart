import 'package:disability_interaction_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isEmail = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        if (isEmail) {
          final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegExp.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }


        if (isPassword) {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.greyMed14,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: isPassword ? const Icon(Icons.visibility_off_outlined) : null,
      ),
    );
  }
}