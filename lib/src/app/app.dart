import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_trial/src/presentation/pages/home/home_page.dart';
import 'package:onboarding_trial/src/presentation/pages/onboarding/onboarding_page.dart';
import 'package:onboarding_trial/src/presentation/pages/register/register_page.dart';
import 'package:onboarding_trial/src/routes/my_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.register,
        color: Colors.red,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
            accentColor: Colors.red,
          ),
          highlightColor: Colors.red,
          textTheme: GoogleFonts.interTextTheme(),
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.register: (context) => const RegisterPage(),
          MyRoutes.onboarding: (context) => const OnboardingPage(),
        });
  }
}
