class Food {
  final String name;              //chesse burger
  final String description;       //um hamburguer com queijo
  final String imagePath;          
  final double price;             // R$20
  final FoodCategory category;    //hamburger
  List<Addon> availableAddons;    //[queijo extra, molho, ...]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//CATEGORIAS

enum FoodCategory {
  Hamburgers, //hamburgers
  Saladas, //saladas
  Acompanhamentos, //acompanhamentos
  Sobremesas, //sobremesas
  Bebidas, //bebidas
}

//COMPLEMENTOS

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
