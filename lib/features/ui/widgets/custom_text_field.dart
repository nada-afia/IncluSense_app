import 'package:incluesense/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isEmail = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      keyboardType: widget.isEmail
          ? TextInputType.emailAddress
          : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        if (widget.isEmail) {
          final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegExp.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }

        if (widget.isPassword) {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppStyles.greyMed14,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              )
            : null,
      ),
    );
  }
}
