import 'package:cooking_book/providers/dish_provider.dart';
import 'package:cooking_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/dishes_db.dart';

class BreakfastPage extends StatefulWidget {
  const BreakfastPage({super.key});

  @override
  State<BreakfastPage> createState() => _BreakfastPageState();
}

class _BreakfastPageState extends State<BreakfastPage> {
  void _onDishTap(index, BuildContext context) {
    final id = dishList[index].id;
    Provider.of<DishProvider>(context, listen: false).selectDish(id);
    Navigator.of(context).pushNamed('/breakfast/dishPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '         Сніданки',
          style: TextStyle(
            fontFamily: 'Sweet Mavka Script',
            //   fontWeight: FontWeight.w300,
            fontSize: 32,
          ),
        ),
        backgroundColor: const Color(0xFF90CED4),
      ),
      floatingActionButtonLocation: // Кнопка добавити рецепт
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 65,
        height: 65,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF90CED4),
          shape: const CircleBorder(),
          elevation: 0,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ), // Кінець кнопки добавити рецепт
      backgroundColor: Colors.grey[50], // колір бекграунда
      body: ListView.builder(
          itemCount: dishList.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final dishes = dishList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              dishes.imagePath,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                dishes.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                dishes.complexity,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                dishes.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.grey.withOpacity(0.2),
                      onTap: () => _onDishTap(index, context),
                    ),
                  ),
                ],
              ),
            );
          }),

      bottomNavigationBar: const BottomBar(),
    );
  }
}
