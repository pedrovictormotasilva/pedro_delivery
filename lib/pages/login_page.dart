import 'package:data_persistence/components/my_button.dart';
import 'package:data_persistence/components/my_textfield.dart';
import 'package:data_persistence/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    //get instancia do servico de login
    final _authService = AuthService();

    //try logar
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text
          );
    } 

    //mostre os erros
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }

    //esqueci minha senha
    void forgotPw() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("usuario logado esqeceu a senha"),
        ),
      );
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //LOGO
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),

            //TEXTO
            Text(
              "Pedro Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //EMAIL
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            //SENHA

            const SizedBox(
              height: 10,
            ),

            MyTextfield(
              controller: passwordController,
              hintText: "Senha",
              obscureText: true,
            ),

            //BOTAO LOGAR

            const SizedBox(
              height: 25,
            ),

            MyButton(
              text: "Logar",
              onTap: login,
            ),

            //NAO CADASTRADO

            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Não está cadastrado?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Crie sua conta",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
