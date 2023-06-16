import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m3_flutter_login/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:m3_flutter_login/forgot_password.dart';
import 'package:m3_flutter_login/signup_page.dart';

import 'app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: ColorSeed.baseColor.color,
          useMaterial3: true,
          fontFamily: GoogleFonts.outfit().fontFamily,
          typography: Typography.material2021(
            platform: defaultTargetPlatform,
          ),
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorSchemeSeed: ColorSeed.baseColor.color,
          useMaterial3: true,
          fontFamily: GoogleFonts.outfit().fontFamily,
          typography: Typography.material2021(
            platform: defaultTargetPlatform,
          ),
          brightness: Brightness.dark),
      routerConfig: _goRouter,
    );
  }
}

GoRouter _goRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) {
        return LoginPage();
      },
      routes: [
        GoRoute(
          path: "forgotpassword",
          builder: (context, state) => ForgotPasswordPage(),
        ),
        GoRoute(
          path: 'signup',
          builder: (context, state) {
            return SignUpPage();
          },
        )
      ]),
]);
