import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Sua localização"),
              content: const TextField(
                decoration: InputDecoration(
                  hintText: ('Procure sua localização..'),
                ),
              ),
              actions: [
                //BOTAO DE CANCELAR
                MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar")),

                //BOTAO DE SALVAR
                MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Salvar")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Peça agora!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //endereco
                Text(
                  "8156 Barreira Ce",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //menu dropdown
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
