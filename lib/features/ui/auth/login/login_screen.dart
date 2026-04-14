import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incluesense/core/localization/l10n/app_localizations.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_routes.dart';
import 'package:incluesense/core/utils/app_styles.dart';
import 'package:incluesense/features/ui/widgets/custom_alert_dialog.dart';
import 'package:incluesense/features/ui/widgets/custom_elevated_button.dart';

import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                CustomTextField(
                  isEmail: true,
                  hint: "yourname@email.com",
                  controller: emailController,
                ),
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
                  controller: passwordController,
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
                  onPressed: login,
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

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        Navigator.pushNamed(context, AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          showDialog(
            context: context,
            builder: (context) {
              return CustomAlertDialog(content: 'Invalid email or password.');
            },
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              content: 'An error occurred. Please try again.',
            );
          },
        );
      }
    }
  }
}
