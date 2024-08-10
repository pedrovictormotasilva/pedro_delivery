import 'package:data_persistence/models/food.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // IMAGEM DO TOPO
          Image.asset(widget.food.imagePath),

          // NOME
          Text(widget.food.name, style: TextStyle(fontSize: 24)),

          // DESCRIÇÃO
          Text(widget.food.description),

          // ACOMPANHAMENTOS

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.food.availableAddons.length,
            itemBuilder: (context, index) {
              //pegando inidividualmente cada acompnhamento
              Addon addon = widget.food.availableAddons[index];
              //retornando as intefarces das checksboxs
              return CheckboxListTile(
                title: Text(addon.name),
                subtitle: Text('\$'+addon.price.toString()),
                value: false,
                onChanged: (value) {},
              );
            },
          ),

          // BOTÃO DO CARRINHO
        ],
      ),
    );
  }
}
