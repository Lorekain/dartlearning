import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  // Нижня панель BottomNavigationBar
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      fixedColor: const Color(0xFF90CED4),
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      iconSize: 32,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_rounded),
          label: '',
        ),
      ],
    );
  }
}
