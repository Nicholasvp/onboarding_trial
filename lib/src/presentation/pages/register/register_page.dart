import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_trial/src/presentation/core/my_images.dart';
import 'package:onboarding_trial/src/presentation/core/my_typography.dart';
import 'package:onboarding_trial/src/routes/my_routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              MyImages.bgRed,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Register',
                          style: MyTypography.titleBig,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Email',
                          style: MyTypography.body1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Password',
                          style: MyTypography.body1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Confirm Password',
                          style: MyTypography.body1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(MyRoutes.onboarding);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
