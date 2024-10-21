import 'package:cooking_book/widgets/bottom_navigation_bar.dart';
import 'package:cooking_book/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Колір навігаційної панелі
      statusBarColor: Colors.transparent, // Колір статус-бару
    ));
    final String font = 'Miama Nueva';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),

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
        bottomNavigationBar: const BottomBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Пошук по назві або інгрідієнтам...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Sweet Mavka Script',
                      //  fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCard(categoryTitle: 'Сніданки'),
                  CategoryCard(categoryTitle: 'Обідік'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCard(categoryTitle: 'Вечерик'),
                  CategoryCard(categoryTitle: 'Десертик'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
