/*import 'package:cooking_book/model/dish.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:hive/hive.dart';

class DishesAdapter extends TypeAdapter<Dish> {
  @override
  final int typeId = 0;

  @override
  Dish read(BinaryReader reader) {
    int id = reader.readInt();
    String title = reader.readString();
    String complexity = reader.readString();
    String description = reader.readString();
    String imagePath = reader.readString();
    String recipe = reader.readString();

    return Dish(
        id: id,
        title: title,
        complexity: complexity,
        description: description,
        imagePath: imagePath,
        recipe: recipe);
  }

  @override
  void write(BinaryWriter writer, Dish obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.complexity);
    writer.writeString(obj.description);
    writer.writeString(obj.imagePath);
    writer.writeString(obj.recipe);
  }
}
*/