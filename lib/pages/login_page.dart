import 'package:data_persistence/components/my_button.dart';
import 'package:data_persistence/components/my_textfield.dart';
import 'package:data_persistence/pages/home_page.dart';
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

  void login() {
    /* 
    
    depois eu faco essa bomba
    
    
    */
    // navegacao para home page

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),);
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
