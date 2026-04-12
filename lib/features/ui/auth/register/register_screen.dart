import 'package:flutter/material.dart';
import 'package:incluesense/core/localization/l10n/app_localizations.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_routes.dart';
import 'package:incluesense/core/utils/app_styles.dart';
import 'package:incluesense/features/ui/widgets/custom_elevated_button.dart';

import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.createAnAccount,
          style: AppStyles.blackMed18,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.createAnAccount,
                  style: AppStyles.blackBold24,
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(Icons.person, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.name,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const CustomTextField(hint: "John Doe"),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.email, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.emailAddress,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const CustomTextField(
                  hint: "yourname@email.com",
                  isEmail: true,
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.password,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hint: AppLocalizations.of(context)!.enterPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.confirmPassword,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hint: AppLocalizations.of(context)!.confirmPassword,
                ),

                const SizedBox(height: 24),

                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.signUp,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.home);
                    }
                  },
                ),

                const SizedBox(height: 20),

                Center(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAnAccount,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signIn,
                          style: AppStyles.blueBold14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
