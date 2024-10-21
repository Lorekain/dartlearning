import "package:flutter/material.dart";

class CategoryCard extends StatelessWidget {
  final String? categoryTitle;
  const CategoryCard({super.key, required this.categoryTitle});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: const Color.fromARGB(255, 241, 241, 241),
      width: 150,
      height: 230,
      child: Column(
        children: [
          Container(
            width: 119,
            height: 41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF90CED4),
            ),
            child: Center(
                child: Text(
              '$categoryTitle',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          const Placeholder(
            fallbackHeight: 150,
            fallbackWidth: 150,
          ),
        ],
      ),
    );
  }
}
