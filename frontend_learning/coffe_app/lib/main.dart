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
        backgroundColor: const Color(0xFF201520),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 32,),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 16),
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
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              //padding: EdgeInsets.all(12),
                              padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0x1AFFFFFF)),
                              margin: EdgeInsets.only(left: 63, bottom: 16),
                              height: 235, // было 230 нужно убрать падинги снизу
                              width: 130, // было 130 по макету
                              child: Column(
                                children: [
                                  //SizedBox(height: 12),
                                  Image.asset(
                                    'assets/png/cappuchino.png',
                                    width: 111,
                                    height: 111,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Cinnamon & Cocoa',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Rosarivo',
                                      // fontWeight: FontWeight.w400,
                                      // height: 0.6,
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
                                          '₹99',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.6,
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 39,
                                          height: 39,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                          color: Color(0xFFEFE3C8),),
                                          
                                          
                                            child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                          color: Colors.black,  
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(width: 30),
                             Container(
                              //padding: EdgeInsets.all(12),
                              padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0x1AFFFFFF)),
                              margin: EdgeInsets.only(left: 16, bottom: 16), // 16 po maketu
                              height: 235, // было 230 нужно убрать падинги снизу
                              width: 130, // было 130 по макету
                              child: Column(
                                children: [
                                  //SizedBox(height: 12),
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
                                      // fontWeight: FontWeight.w400,
                                      // height: 0.6,
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
                                          '₹99',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.6,
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 39,
                                          height: 39,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                          color: Color(0xFFEFE3C8),),
                                          
                                          
                                            child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                          color: Colors.black,  
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              //padding: EdgeInsets.all(12),
                              padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0x1AFFFFFF)),
                              margin: EdgeInsets.only(left: 63, bottom: 16),
                              height: 235, // было 230 нужно убрать падинги снизу
                              width: 130, // было 130 по макету
                              child: Column(
                                children: [
                                  //SizedBox(height: 12),
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
                                      // fontWeight: FontWeight.w400,
                                      // height: 0.6,
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
                                          '₹99',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.6,
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 39,
                                          height: 39,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                          color: Color(0xFFEFE3C8),),
                                          
                                          
                                            child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                          color: Colors.black,  
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(width: 30),
                             Container(
                              //padding: EdgeInsets.all(12),
                              padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0x1AFFFFFF)),
                              margin: EdgeInsets.only(left: 16, bottom: 16), // 16 po maketu
                              height: 235, // было 230 нужно убрать падинги снизу
                              width: 130, // было 130 по макету
                              child: Column(
                                children: [
                                  //SizedBox(height: 12),
                                  Image.asset(
                                    'assets/png/macha.png',
                                    width: 111,
                                    height: 111,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Dalgona Whipped Macha',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 14,
                                      fontFamily: 'Rosarivo',
                                      // fontWeight: FontWeight.w400,
                                      // height: 0.6,
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
                                          '₹99',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Rosarivo',
                                            fontWeight: FontWeight.w600,
                                            // height: 0.6,
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Container(
                                          width: 39,
                                          height: 39,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                          color: Color(0xFFEFE3C8),),
                                          
                                          
                                            child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                          color: Colors.black,  
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
