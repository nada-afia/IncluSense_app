import 'package:flutter/material.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.blueColor,
        ),
        onPressed: onPressed,
        child: Text(text, style: AppStyles.whiteMed18),
      ),
    );
  }
}
