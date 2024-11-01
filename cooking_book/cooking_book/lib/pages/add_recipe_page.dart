import 'dart:io';

import 'package:cooking_book/model/dish.dart';
import 'package:cooking_book/model/ingredient.dart';
import 'package:flutter/material.dart';

import '../model/dishes_db.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();
  String? selectedDifficulty;
  List<Map<String, String>> ingredients = [];

  // Список для збереження рецептів
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  void _addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Збереження обраного зображення
      });
      // Додатковий код для обробки зображення
    }
  }

  void _addIngredient() {
    if (ingredientController.text.isNotEmpty &&
        quantityController.text.isNotEmpty) {
      setState(() {
        ingredients.add({
          'ingredient': ingredientController.text,
          'quantity': quantityController.text,
        });
        ingredientController.clear();
        quantityController.clear();
      });
    }
  }

  void addDishElement() {
    final id = 9;
    //final id = dishList.last.id + 1;
    final title = titleController.text;
    final description = descriptionController.text;
    final complexity = selectedDifficulty ?? " ";
    const imagePath = 'assets/img/evening.jpg';
    final recipe = instructionController.text;
    final titleIngredient = ingredientController.text;
    final quantityIngredient = quantityController.text;

    final newDish = Dish(
        id: id,
        title: title,
        complexity: complexity,
        description: description,
        imagePath: imagePath,
        recipe: recipe,
        ingredient: [
          Ingredients(
            titleIngredient,
            quantityIngredient,
            ingredientIcons[titleIngredient] ?? 'assets/img/garlic.png',
          ),
        ]);

    setState(() {
      dishList.add(newDish);
      Navigator.pop(context, newDish);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '   Додати рецепт',
          style: TextStyle(
            fontFamily: 'Sweet Mavka Script',
            fontSize: 32,
          ),
        ),
        backgroundColor: const Color(0xFF90CED4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _addImage,
                child: _selectedImage != null
                    ? Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Image.file(_selectedImage!),
                        ),
                      )
                    : Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('Натисніть, щоби додати зображення'),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Назва рецепту',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Опис',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              ...ingredients.map((ingredient) => ListTile(
                    title: Text(ingredient['ingredient']!),
                    subtitle: Text('Кількість: ${ingredient['quantity']}'),
                  )),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Складність',
                ),
                value: selectedDifficulty,
                items: ['Легко', 'Середне', 'Складно'].map((String difficulty) {
                  return DropdownMenuItem<String>(
                    value: difficulty,
                    child: Text(difficulty),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDifficulty = value;
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ingredientController,
                      decoration: const InputDecoration(
                        labelText: 'Інгрідієнт',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Кількість',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addIngredient,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: instructionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Інструкція',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFF90CED4)),
                    foregroundColor: WidgetStateProperty.all(Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addDishElement(); // Виклик методу для додавання рецепту

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Рецепт збережений')),
                    );
                  }
                },
                child: const Text('Зберегти рецепт'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
