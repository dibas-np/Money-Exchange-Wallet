import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/my_cards.dart';
import '../pages/pay.dart';
import '../pages/profile.dart';
import '../pages/scan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    ScanPage(),
    PayPage(),
    MyCardsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF51E5F6),
        iconSize: 30,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/scan.png',
              ),
            ),
            label: 'Scan',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Pay',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'My Cards',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.red,
          ),
        ],
        onTap: (index) {
          setState(
            () {
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayPage()),
                );
              }
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
