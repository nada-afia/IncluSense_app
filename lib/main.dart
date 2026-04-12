import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:incluesense/core/utils/app_routes.dart';
import 'package:incluesense/features/ui/auth/login/login_screen.dart';
import 'package:incluesense/features/ui/auth/register/register_screen.dart';
import 'package:incluesense/features/ui/pages/home/home_screen.dart';
import 'package:incluesense/firebase_options.dart';

import 'core/localization/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
    );
  }
}
