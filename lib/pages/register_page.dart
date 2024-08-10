import 'package:data_persistence/components/my_button.dart';
import 'package:data_persistence/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              "Crie uma conta nova!",
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

            //COMFIRME SENHA
            const SizedBox(
              height: 10,
            ),

            MyTextfield(
                controller: confirmPasswordController,
                hintText: "Comfirme sua senha",
                obscureText: false),

            //BOTAO LOGAR

            const SizedBox(
              height: 25,
            ),

            MyButton(
              text: "Cadastrar",
              onTap: () {},
            ),

            //LOGAR SE TIVER CONTAR

            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Já está cadastrado?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Entre aqui",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
