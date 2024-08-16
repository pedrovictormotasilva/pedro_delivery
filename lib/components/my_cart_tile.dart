import 'package:data_persistence/components/my_quantity_selector.dart';
import 'package:data_persistence/models/cart_item.dart';
import 'package:data_persistence/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //imagem
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  //nome e preco
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nome da comida
                      Text(cartItem.food.name),

                      //preco da comida
                      Text(
                        '\$' + cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      MyQuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                      )
                    ],
                  ),

                  const Spacer(),

                  //aumentar ou diminuir quantidade
                ],
              ),
            ),

            //acompnhamentos
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              //nome do acompnahmento
                              Text(addon.name),
                              //preco do acompanhamento
                              Text(
                                ' (\$' + addon.price.toString() + ')',
                              ),
                            ],
                          ),
                          onSelected: (value) {},
                          shape: StadiumBorder(
                              side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          )),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
