import 'package:cooking_book/pages/breakfast.dart';
import 'package:cooking_book/pages/home.dart';
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/breakfast': (context) => const BreakfastPage(),
      },
    );
  }
}
