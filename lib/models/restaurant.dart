import 'package:collection/collection.dart';
import 'package:data_persistence/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/food.dart';

class Restaurant extends ChangeNotifier {
  // LISTA DE MENUS
  final List<Food> _menu = [];

  Restaurant() {
    // BURGERS
    _menu.addAll([
      Food(
        name: "CheeseBurger Clássico",
        description:
            "Um hambúrguer clássico com queijo cheddar derretido, alface, tomate, e molho especial.",
        imagePath: "lib/images/burgers/1.png",
        price: 19.99,
        category: FoodCategory.Hamburgers,
        availableAddons: [
          Addon(name: "Queijo Extra", price: 2.50),
          Addon(name: "Bacon", price: 3.00),
          Addon(name: "Picles", price: 1.50),
        ],
      ),
      Food(
        name: "BaconBurger",
        description:
            "Hambúrguer suculento com queijo cheddar, bacon crocante e molho barbecue.",
        imagePath: "lib/images/burgers/2.png",
        price: 22.99,
        category: FoodCategory.Hamburgers,
        availableAddons: [
          Addon(name: "Cebola Caramelizada", price: 2.00),
          Addon(name: "Molho Ranch", price: 1.50),
          Addon(name: "Tomate", price: 1.00),
        ],
      ),
      Food(
        name: "VeggieBurger",
        description:
            "Delicioso hambúrguer vegetariano com alface, tomate, e molho de ervas.",
        imagePath: "lib/images/burgers/3.png",
        price: 17.99,
        category: FoodCategory.Hamburgers,
        availableAddons: [
          Addon(name: "Queijo Vegano", price: 2.50),
          Addon(name: "Abacate", price: 3.00),
          Addon(name: "Molho Picante", price: 1.50),
        ],
      ),
      Food(
        name: "SpicyChickenBurger",
        description:
            "Hambúrguer de frango apimentado com alface, tomate, e maionese picante.",
        imagePath: "lib/images/burgers/4.png",
        price: 21.99,
        category: FoodCategory.Hamburgers,
        availableAddons: [
          Addon(name: "Queijo Pepper Jack", price: 2.50),
          Addon(name: "Molho Ranch", price: 1.50),
          Addon(name: "Pepino", price: 1.00),
        ],
      ),
      Food(
        name: "DoubleCheeseBurger",
        description:
            "Dois hambúrgueres suculentos com queijo cheddar duplo, alface, tomate e molho especial.",
        imagePath: "lib/images/burgers/5.png",
        price: 24.99,
        category: FoodCategory.Hamburgers,
        availableAddons: [
          Addon(name: "Bacon Extra", price: 3.00),
          Addon(name: "Molho Barbecue", price: 1.50),
          Addon(name: "Queijo Suíço", price: 2.50),
        ],
      ),
    ]);

    // SALADS
    _menu.addAll([
      Food(
        name: "Caesar Salad",
        description:
            "Salada Caesar clássica com alface romana, croutons e molho Caesar.",
        imagePath: "lib/images/salads/1.png",
        price: 14.99,
        category: FoodCategory.Saladas,
        availableAddons: [
          Addon(name: "Frango Grelhado", price: 4.00),
          Addon(name: "Queijo Parmesão", price: 2.00),
          Addon(name: "Ovos Cozidos", price: 1.50),
        ],
      ),
      Food(
        name: "Greek Salad",
        description:
            "Salada grega com tomate, pepino, cebola, azeitonas e queijo feta.",
        imagePath: "lib/images/salads/2.png",
        price: 16.99,
        category: FoodCategory.Saladas,
        availableAddons: [
          Addon(name: "Azeitonas Extras", price: 1.50),
          Addon(name: "Pão Sírio", price: 3.00),
          Addon(name: "Pepino", price: 1.00),
        ],
      ),
      Food(
        name: "Cobb Salad",
        description:
            "Salada Cobb com alface, tomate, frango, bacon, ovo e queijo azul.",
        imagePath: "lib/images/salads/3.png",
        price: 18.99,
        category: FoodCategory.Saladas,
        availableAddons: [
          Addon(name: "Abacate", price: 3.00),
          Addon(name: "Frango Grelhado", price: 4.00),
          Addon(name: "Molho Ranch", price: 1.50),
        ],
      ),
      Food(
        name: "Caprese Salad",
        description:
            "Salada Caprese com tomate, mussarela de búfala e manjericão.",
        imagePath: "lib/images/salads/4.png",
        price: 15.99,
        category: FoodCategory.Saladas,
        availableAddons: [
          Addon(name: "Pesto", price: 2.50),
          Addon(name: "Pão Italiano", price: 2.00),
          Addon(name: "Vinagrete Balsâmico", price: 1.50),
        ],
      ),
      Food(
        name: "Quinoa Salad",
        description:
            "Salada de quinoa com vegetais frescos, grão-de-bico e molho de limão.",
        imagePath: "lib/images/salads/5.png",
        price: 17.99,
        category: FoodCategory.Saladas,
        availableAddons: [
          Addon(name: "Abacate", price: 3.00),
          Addon(name: "Nozes", price: 2.50),
          Addon(name: "Molho Tahine", price: 2.00),
        ],
      ),
    ]);

    // DRINKS
    _menu.addAll([
      Food(
        name: "Coca-Cola",
        description: "Refrigerante gelado de Coca-Cola.",
        imagePath: "lib/images/drinks/1.png",
        price: 4.99,
        category: FoodCategory.Bebidas,
        availableAddons: [
          Addon(name: "Gelo Extra", price: 0.50),
          Addon(name: "Limão", price: 0.50),
          Addon(name: "Canudo de Papel", price: 0.20),
        ],
      ),
      Food(
        name: "Suco de Laranja",
        description: "Suco natural de laranja, fresco e gelado.",
        imagePath: "lib/images/drinks/2.png",
        price: 6.99,
        category: FoodCategory.Bebidas,
        availableAddons: [
          Addon(name: "Gelo", price: 0.50),
          Addon(name: "Menta", price: 1.00),
          Addon(name: "Gengibre", price: 0.50),
        ],
      ),
      Food(
        name: "Chá Gelado",
        description: "Chá gelado refrescante com sabor de limão.",
        imagePath: "lib/images/drinks/3.png",
        price: 5.99,
        category: FoodCategory.Bebidas,
        availableAddons: [
          Addon(name: "Limão", price: 0.50),
          Addon(name: "Hortelã", price: 1.00),
          Addon(name: "Mel", price: 0.50),
        ],
      ),
      Food(
        name: "Smoothie de Morango",
        description: "Smoothie cremoso de morango com iogurte.",
        imagePath: "lib/images/drinks/4.png",
        price: 7.99,
        category: FoodCategory.Bebidas,
        availableAddons: [
          Addon(name: "Granola", price: 2.00),
          Addon(name: "Chia", price: 1.50),
          Addon(name: "Mel", price: 1.00),
        ],
      ),
      Food(
        name: "Água com Gás",
        description: "Água mineral com gás, refrescante e leve.",
        imagePath: "lib/images/drinks/5.png",
        price: 3.99,
        category: FoodCategory.Bebidas,
        availableAddons: [
          Addon(name: "Limão", price: 0.50),
          Addon(name: "Gelo Extra", price: 0.50),
          Addon(name: "Menta", price: 1.00),
        ],
      ),
    ]);

    // DESSERTS
    _menu.addAll([
      Food(
        name: "Cheesecake",
        description: "Cheesecake cremoso com calda de frutas vermelhas.",
        imagePath: "lib/images/desserts/1.png",
        price: 12.99,
        category: FoodCategory.Sobremesas,
        availableAddons: [
          Addon(name: "Calda Extra", price: 2.00),
          Addon(name: "Chantilly", price: 1.50),
          Addon(name: "Frutas Frescas", price: 2.50),
        ],
      ),
      Food(
        name: "Brownie com Sorvete",
        description:
            "Brownie de chocolate quente servido com sorvete de baunilha.",
        imagePath: "lib/images/desserts/2.png",
        price: 14.99,
        category: FoodCategory.Sobremesas,
        availableAddons: [
          Addon(name: "Nozes", price: 2.00),
          Addon(name: "Calda de Caramelo", price: 1.50),
          Addon(name: "Granulado", price: 1.00),
        ],
      ),
      Food(
        name: "Tiramisu",
        description: "Clássico tiramisu italiano com café e mascarpone.",
        imagePath: "lib/images/desserts/3.png",
        price: 13.99,
        category: FoodCategory.Sobremesas,
        availableAddons: [
          Addon(name: "Cacau em Pó", price: 1.00),
          Addon(name: "Raspas de Chocolate", price: 1.50),
          Addon(name: "Licor", price: 2.00),
        ],
      ),
      Food(
        name: "Mousse de Chocolate",
        description: "Mousse de chocolate rico e cremoso.",
        imagePath: "lib/images/desserts/4.png",
        price: 11.99,
        category: FoodCategory.Sobremesas,
        availableAddons: [
          Addon(name: "Granulado", price: 1.00),
          Addon(name: "Frutas Vermelhas", price: 2.50),
          Addon(name: "Chantilly", price: 1.50),
        ],
      ),
      Food(
        name: "Sorvete Sundae",
        description:
            "Sundae de sorvete com calda de chocolate e cereja no topo.",
        imagePath: "lib/images/desserts/5.png",
        price: 9.99,
        category: FoodCategory.Sobremesas,
        availableAddons: [
          Addon(name: "Amendoim", price: 1.50),
          Addon(name: "Calda de Caramelo", price: 1.50),
          Addon(name: "Granulado Colorido", price: 1.00),
        ],
      ),
    ]);

    // SIDES
    _menu.addAll([
      Food(
        name: "Batata Frita",
        description: "Porção de batata frita crocante.",
        imagePath: "lib/images/sides/1.png",
        price: 7.99,
        category: FoodCategory.Acompanhamentos,
        availableAddons: [
          Addon(name: "Molho de Queijo", price: 2.00),
          Addon(name: "Bacon Bits", price: 1.50),
          Addon(name: "Molho Barbecue", price: 1.50),
        ],
      ),
      Food(
        name: "Anéis de Cebola",
        description: "Anéis de cebola empanados e fritos.",
        imagePath: "lib/images/sides/2.png",
        price: 8.99,
        category: FoodCategory.Acompanhamentos,
        availableAddons: [
          Addon(name: "Molho Ranch", price: 1.50),
          Addon(name: "Molho Barbecue", price: 1.50),
          Addon(name: "Pimenta Jalapeño", price: 1.00),
        ],
      ),
      Food(
        name: "Batata Doce com salmi",
        description: "Porção de batata doce com salmi, levemente salgada.",
        imagePath: "lib/images/sides/3.png",
        price: 8.99,
        category: FoodCategory.Acompanhamentos,
        availableAddons: [
          Addon(name: "Molho de Mel e Mostarda", price: 2.00),
          Addon(name: "Queijo Parmesão", price: 2.00),
          Addon(name: "Molho Picante", price: 1.50),
        ],
      ),
      Food(
        name: "Batata Doce",
        description: "Porção de batata doce, levemente salgada.",
        imagePath: "lib/images/sides/4.png",
        price: 8.99,
        category: FoodCategory.Acompanhamentos,
        availableAddons: [
          Addon(name: "Molho de Mel e Mostarda", price: 2.00),
          Addon(name: "Queijo Parmesão", price: 2.00),
          Addon(name: "Molho Picante", price: 1.50),
        ],
      ),
      Food(
        name: "Batata com banana",
        description: "Porção de batata frita com banana, levemente salgada.",
        imagePath: "lib/images/sides/5.png",
        price: 8.99,
        category: FoodCategory.Acompanhamentos,
        availableAddons: [
          Addon(name: "Molho de Mel e Mostarda", price: 2.00),
          Addon(name: "Queijo Parmesão", price: 2.00),
          Addon(name: "Molho Picante", price: 1.50),
        ],
      ),
    ]);
  }

  /*
  
   G E T T E R S
  
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  
   O P E R A D O R E S 
  
  */

  //carrinho do usuario
  final List<CartItem> _cart = [];

  //adicionar ao carrinho
  void addToCart(Food food, List<Addon> selectedAddons) {
    // veja se já existe um item do carrinho com a mesma comida e complementos selecionados
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // checar se as comidas são as mesmas
      bool isSameFood = item.food == food;

      // checar se a lista de acompanhamentos selecionados são os mesmos
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      // Retornar se ambos são verdadeiros
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remover do carrinho
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total do preco do carrinho
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get do numero total de items dentro do carrinho

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //zerar carrinho
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  
   H E L P E R S 
  
  */

  //gerar receita
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Aqui está seu recibo");
    receipt.writeln();

    //formatar a data para incluir apenas segundos
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            "   Acompanhamentos: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Pedido Total: ${getTotalItemCount()}");
    receipt.writeln("Preço total: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //formartar o valor double em dindin
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //formatar a lista de acompanhamentos em um sumario de strings
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
