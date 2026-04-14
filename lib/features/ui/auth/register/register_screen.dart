import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incluesense/core/localization/l10n/app_localizations.dart';
import 'package:incluesense/core/utils/app_colors.dart';
import 'package:incluesense/core/utils/app_routes.dart';
import 'package:incluesense/core/utils/app_styles.dart';
import 'package:incluesense/features/ui/widgets/custom_alert_dialog.dart';
import 'package:incluesense/features/ui/widgets/custom_elevated_button.dart';

import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.name,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextField(hint: "John Doe"),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context)!.emailAddress,
                      style: AppStyles.blackBold14,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hint: "yourname@email.com",
                  isEmail: true,
                  controller: emailController,
                ),
                SizedBox(height: 12),

                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue),
                    SizedBox(width: 5),
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
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Must contain uppercase letter';
                    }
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'Must contain a number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.blue),
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
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.signUp,
                  onPressed: register,
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

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        Navigator.pushNamed(context, AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) {
              return CustomAlertDialog(
                content: 'The account already exists for that email.',
              );
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
