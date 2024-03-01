class Dish {
  final int id;
  final String name;
  final List ingredients;
  final int weight;
  final String dishType;
  final int price;

  Dish({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.weight,
    required this.dishType,
    required this.price,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'] as int,
      name: json['name'] as String,
      ingredients: json['ingredients'] as List,
      weight: json['weight'] as int,
      dishType: json['dishType'] as String,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'weight': weight,
        'dishType': dishType,
        'price': price,
      };
}
