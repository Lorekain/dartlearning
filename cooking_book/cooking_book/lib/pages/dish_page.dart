import 'package:cooking_book/model/dishes_db.dart';
import 'package:cooking_book/model/ingredient.dart';
import 'package:cooking_book/providers/dish_provider.dart';
import 'package:cooking_book/providers/toggle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishPage extends StatelessWidget {
  final int dishId;

  const DishPage({
    super.key,
    required this.dishId,
  });

  @override
  Widget build(BuildContext context) {
    final toggleProvider = context.watch<ToggleProvider>();
    final dishProvider = Provider.of<DishProvider>(context);
    final id = dishProvider.selectedDishId;
    dishList[id!].ingredient;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                dishList[id].imagePath,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dishList[id].title,
                        style: const TextStyle(
                          fontSize: 26,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        dishList[id].description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 370,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFE6EBF2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => toggleProvider.isRecipeFalse(),
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: toggleProvider.isRecipe
                                          ? const Color(0xFFE6EBF2)
                                          : const Color(0xFF90CED4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Інгрідієнти',
                                        style: TextStyle(
                                          color: toggleProvider.isRecipe
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => toggleProvider.isRecipeTrue(),
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: toggleProvider.isRecipe
                                            ? const Color(0xFF90CED4)
                                            : const Color(0xFFE6EBF2),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                      child: Text(
                                        'Інструкція',
                                        style: TextStyle(
                                          color: toggleProvider.isRecipe
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: toggleProvider.isRecipe,
                        child: Text(
                          dishList[id].recipe,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !toggleProvider.isRecipe,
                  child: Column(
                    children: dishList[id].ingredient.map((ingredient) {
                      return Column(
                        children: [
                          Ingredient(
                            title: ingredient.title,
                            subtitle: ingredient.subtitle,
                            imgPath: ingredientIcons[ingredient.title] ??
                                'assets/img/garlic.png',
                            //ingredient.imgPath,
                          ),
                          const Divider(height: 0),
                        ],
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Ingredient extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgPath;

  const Ingredient({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imgPath),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
