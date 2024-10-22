import 'package:cooking_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

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
      body: const Center(child: Text('pisya')),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
