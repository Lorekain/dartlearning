import 'package:cooking_book/model/dishes_adapter.dart';
import 'package:cooking_book/pages/add_recipe_page.dart';
import 'package:cooking_book/pages/breakfast.dart';
import 'package:cooking_book/pages/dish_page.dart';
import 'package:cooking_book/pages/home.dart';
import 'package:cooking_book/providers/dish_provider.dart';
import 'package:cooking_book/providers/toggle_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(DishesAdapter());
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
        ChangeNotifierProvider(create: (context) => DishProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/breakfast': (context) => const BreakfastPage(),
          '/breakfast/dishPage': (context) {
            final arguments = ModalRoute.of(context)?.settings.arguments;
            if (arguments is int) {
              return DishPage(dishId: arguments);
            } else {
              return const DishPage(dishId: 1);
            }
          },
          '/add': (context) => const AddRecipePage(),
        },
      ),
    );
  }
}
