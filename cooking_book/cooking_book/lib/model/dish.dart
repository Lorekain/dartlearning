import 'package:cooking_book/model/ingredient.dart';

class Dish {
  final String imagePath;
  final String title;
  final String complexity;
  final String description;
  final int id;
  final String recipe;
  final List<Ingredients> ingredient;

  Dish(
      {required this.id,
      required this.title,
      required this.complexity,
      required this.description,
      required this.imagePath,
      required this.recipe,
      required this.ingredient});
  @override
  String toString() {
    return 'Dish{id: $id, title: $title, complexity: $complexity, description: $description, imagePath: $imagePath}';
  }
}
