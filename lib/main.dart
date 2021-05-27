import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/splash_screen.dart';
import './pages/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Exchange Wallet',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF9EF1FA),
                      Color(0xFF8BEEF9),
                      Color(0xFF77EBF8),
                      Color(0xFF51E5F6),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                child: LocationAccess(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
