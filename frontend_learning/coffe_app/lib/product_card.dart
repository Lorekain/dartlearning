import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0x1AFFFFFF),
      ),
      margin: EdgeInsets.only(left: 35, top: 16),
      height: 235,
      width: 130,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 111,
            height: 111,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 14,
              fontFamily: 'Rosarivo',
            ),
          ),
          SizedBox(height: 13),
          Container(
            width: 111,
            height: 39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0x14FFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(width: 22),
                Text(
                  price,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontFamily: 'Rosarivo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Color(0xFFEFE3C8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
