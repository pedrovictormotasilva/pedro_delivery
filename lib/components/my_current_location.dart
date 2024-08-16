import 'package:data_persistence/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Sua localização"),
              content: const TextField(
                decoration: InputDecoration(
                  hintText: ('Coloque sua localização..'),
                ),
              ),
              actions: [
                //BOTAO DE CANCELAR
                MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar")),

                //BOTAO DE SALVAR
                MaterialButton(
                    onPressed: () {
                      String newAddress = textController.text;
                      context
                          .read<Restaurant>()
                          .updateDeliveryAddress(newAddress);
                      Navigator.pop(context);
                    },
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
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.deliveryAddress),
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
