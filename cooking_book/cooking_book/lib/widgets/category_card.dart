import "package:flutter/material.dart";

class CategoryCard extends StatelessWidget {
  final String? categoryTitle;
  final String imagePath;
  final String pagePath;
  const CategoryCard(
      {super.key,
      required this.categoryTitle,
      required this.imagePath,
      required this.pagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        //   boxShadow: [
        //  BoxShadow(
        // color: Colors.black,
        //   color: Color(0xFFFBFBFB), // Колір тіні з прозорістю
        // spreadRadius: 1, // Радіус розширення тіні
        //blurRadius: 3, // Радіус розмиття тіні
        // offset: Offset(0, 3), // Зміщення тіні (x, y)
        //    ),
        //  ],
        color: Colors.white,
      ),
      width: 150,
      height: 210,
      child: Column(children: [
        Container(
          width: 120,
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
          height: 5,
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            splashColor: Colors.grey.withOpacity(0.2),
            onTap: () {
              Navigator.pushNamed(context, pagePath);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(imagePath),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
