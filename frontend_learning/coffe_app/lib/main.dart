import 'package:coffe_app/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color.fromARGB(255, 110, 108, 101),

          fixedColor: Color(0xFFEFE3C8),
          backgroundColor: Color(0xFF22151F),
          type: BottomNavigationBarType.fixed,

          iconSize: 36,

          currentIndex: 0,
          // onTap: (){},
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(top: 10),
                height: 36, // Высота контейнера, если нужно
                alignment: Alignment.center,
                child: Icon(Icons.home),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(top: 10),
                height: 36, // Высота контейнера, если нужно
                alignment: Alignment.center,
                child: Icon(Icons.shopping_cart),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(top: 10),
                height: 36, // Высота контейнера, если нужно
                alignment: Alignment.center,
                child: Icon(Icons.add),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(top: 10),
                height: 36, // Высота контейнера, если нужно
                alignment: Alignment.center,
                child: Icon(Icons.add),
              ),
              label: '',
            ),
          ],
        ),
        backgroundColor: const Color(0xFF201520),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      top: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'déjà',
                          style: TextStyle(
                            color: Color(0x80EFE3C8),
                            fontSize: 36,
                            fontFamily: 'Rosarivo',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'Brew',
                          style: TextStyle(
                            color: Color(0xFFEFE3C8),
                            fontSize: 48,
                            fontFamily: 'Rosarivo',
                            fontWeight: FontWeight.w400,
                            height: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Image.asset(
                          'assets/png/profile_picture.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 45,
                    left: 16,
                    right: 16,
                    bottom: 10), // по макету 20 снизу

                child: TextField(
                  style: const TextStyle(
                      color: Color(0x80EFE3C8),
                      fontFamily: 'Rosarivo',
                      fontSize: 14),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        fontFamily: 'Rosarivo',
                        fontSize: 14,
                        color: Color(0x80EFE3C8)),
                    filled: true,
                    fillColor: const Color(0x80171017),
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: const Color(0x80EFE3C8),
                    hintText: 'Browse your favourite coffee...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40)),
                                color: Color(0xFF704341).withOpacity(0.3),
                              ),
                              width: 40,
                              height: 700,
                              child: Column(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Flat White',
                                          style: TextStyle(
                                            color: Color(0xFFEFE3C8)
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        SizedBox(width: 35),
                                        Text(
                                          'Espresso',
                                          style: TextStyle(
                                            color: Color(0xFFEFE3C8)
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Text(
                                          'Americano',
                                          style: TextStyle(
                                            color: Color(0xFFEFE3C8)
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Text(
                                          'Latte',
                                          style: TextStyle(
                                            color: Color(0xFFEFE3C8)
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Text(
                                          'Cappuccino',
                                          style: TextStyle(
                                            color: Color(0xFFEFE3C8),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    // assets/png/cappuchino.png Cinnamon & Cocoa 91
                                    ProductCard(
                                        title: 'Cinnamon & Cocoa',
                                        price: '30',
                                        imagePath: 'assets/png/cappuchino.png'),
                                    SizedBox(width: 16),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 12, left: 12, right: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x1AFFFFFF),
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 16, top: 16),
                                      height: 235,
                                      width: 130,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/png/caramel.png',
                                            width: 111,
                                            height: 111,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Drizzled with Caramel',
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0x14FFFFFF),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 22),
                                                Text(
                                                  '₹99',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 226, 86, 86),
                                                    fontSize: 16,
                                                    fontFamily: 'Rosarivo',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 39,
                                                  height: 39,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
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
                                    ),
                                  ],
                                ),
                                // Второй ряд карточек
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 12, left: 12, right: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x1AFFFFFF),
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 35, top: 16),
                                      height: 235,
                                      width: 130,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/png/blueberry.png',
                                            width: 111,
                                            height: 111,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Bursting Blueberry',
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0x14FFFFFF),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 22),
                                                Text(
                                                  '₹99',
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 16,
                                                    fontFamily: 'Rosarivo',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 39,
                                                  height: 39,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
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
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 12, left: 12, right: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x1AFFFFFF),
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 16, top: 16),
                                      height: 235,
                                      width: 130,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/png/cappuchino.png',
                                            width: 111,
                                            height: 111,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Dalgona Whipped',
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0x14FFFFFF),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 22),
                                                Text(
                                                  '₹99',
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 16,
                                                    fontFamily: 'Rosarivo',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Container(
                                                  width: 39,
                                                  height: 39,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Еспресо',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Ціна: 30 грн',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Лате',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Ціна: 45 грн',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
