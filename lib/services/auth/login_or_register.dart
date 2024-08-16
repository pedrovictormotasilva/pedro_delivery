import 'package:data_persistence/pages/login_page.dart';
import 'package:data_persistence/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //inicialmente mostra a pagina de login para o usuario
  bool showLoginPage = true;
  //escolha entre pagina de login e registro
  void TogglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(onTap: TogglePages);
    } else {
      return RegisterPage(onTap: TogglePages);
    }
  }
}
