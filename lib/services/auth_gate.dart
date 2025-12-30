import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_booking_app/views/home_page.dart';
import 'package:my_booking_app/views/login_page.dart';
import 'package:my_booking_app/views/verify_email_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginPage();
        }

        final user = snapshot.data!;
        if (!user.emailVerified) {
          return const VerifyEmailPage();
        }

        return const HomePage();
      },
    );
  }
}
