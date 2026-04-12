import 'package:flutter/material.dart';
import 'package:incluesense/core/localization/l10n/app_localizations.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_routes.dart';
import 'package:incluesense/core/utils/app_styles.dart';
import 'package:incluesense/features/ui/widgets/custom_elevated_button.dart';

import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.signIn,
          style: AppStyles.blackMed18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomBack,
                  style: AppStyles.blackBold24,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    Text(
                      AppLocalizations.of(context)!.emailAddress,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextField(isEmail: true, hint: "yourname@email.com"),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue),
                    Text(
                      AppLocalizations.of(context)!.password,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextField(
                  isPassword: true,
                  hint: AppLocalizations.of(context)!.enterPassword,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: AppStyles.blueBold14,
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.signIn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.home);
                    }
                  },
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),
                SizedBox(height: 12),
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.newToAdaptiveComms,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createAnAccount,
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
