import 'package:data_persistence/pages/home_page.dart';
import 'package:data_persistence/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //usuario logado
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }

          //usuario nao logado
        },
      ),
    );
  }
}
