import 'package:flutter/material.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final String content;
  const CustomAlertDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: Text('Error', style: AppStyles.blackMed18),
      content: Text(content, style: AppStyles.blackBold14),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK', style: AppStyles.blackBold14),
        ),
      ],
    );
  }
}
