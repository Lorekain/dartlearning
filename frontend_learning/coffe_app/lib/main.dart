// ignore_for_file: prefer_const_constructors
import 'package:flutter_svg/flutter_svg.dart';
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
        backgroundColor: Color(0xFF201520),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 32),

                    //color: Colors.red,
                    //height: 120,
                    // width: 97,
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
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Image.asset(
                          'assets/png/profile_picture.png',
                          height: 50,
                          width: 50,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 45, horizontal: 16),
                  child: TextField(
                    style: TextStyle(color: Color(0x80EFE3C8,
                    ),
                    fontFamily: 'Rosarivo',
                    fontSize: 14),
                    decoration: InputDecoration(
                      
                      hintStyle: TextStyle(
                        fontFamily: 'Rosarivo',
                        fontSize: 14,
                        color: Color(0x80EFE3C8)),
                      filled: true,
                      fillColor: Color(0x80171017),
                      prefixIcon: Icon(Icons.search_rounded),
                      prefixIconColor: Color(0x80EFE3C8),
                      hintText: 'Browse your favourite coffee...',
                      
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                            
                            ),
                            
                            ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
