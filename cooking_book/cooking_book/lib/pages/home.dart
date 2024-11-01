import 'package:cooking_book/widgets/bottom_navigation_bar.dart';
import 'package:cooking_book/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Моя кулінарна книга',
          style: TextStyle(
            fontFamily: 'Sweet Mavka Script',
            //   fontWeight: FontWeight.w300,
            fontSize: 32,
          ),
        )),
        backgroundColor: const Color(0xFF90CED4),
      ),
      backgroundColor: const Color(0xFFFBFBFB),

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
          onPressed: () {
            Navigator.of(context).pushNamed('/add');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ), // Кінець кнопки добавити рецепт
      bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Пошук по назві або інгрідієнтам...',
                  hintStyle: TextStyle(
                    color: Colors.grey,

                    fontFamily: 'Sweet Mavka Script',
                    //  fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                          categoryTitle: 'Сніданок',
                          imagePath: 'assets/img/breakfast.jpg',
                          pagePath: '/breakfast',
                        ),
                        CategoryCard(
                          categoryTitle: 'Перші страви',
                          imagePath: 'assets/img/evening.jpg',
                          pagePath: '/breakfast',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                          categoryTitle: 'Салатіки',
                          imagePath: 'assets/img/salat.jpg',
                          pagePath: '/breakfast',
                        ),
                        CategoryCard(
                          categoryTitle: 'Основні страви',
                          imagePath: 'assets/img/main_dishes_4.jpg',
                          pagePath: '/breakfast',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                          categoryTitle: 'Гарніри',
                          imagePath: 'assets/img/main_dishes.jpg',
                          pagePath: '/breakfast',
                        ),
                        CategoryCard(
                          categoryTitle: 'Десерти',
                          imagePath: 'assets/img/deserts.jpg',
                          pagePath: '/breakfast',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryCard(
                          categoryTitle: 'Напої',
                          imagePath: 'assets/img/main_dishes.jpg',
                          pagePath: '/breakfast',
                        ),
                        CategoryCard(
                          categoryTitle: 'Перекус',
                          imagePath: 'assets/img/salat_2.jpg',
                          pagePath: '/breakfast',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
