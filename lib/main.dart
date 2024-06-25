import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/photo_provider.dart';
import 'screens/Gridview.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Grid App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'animation/gallery.json',
                repeat: true,
                reverse: true,
                animate: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'image/logo.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
      nextScreen:PhotoGridScreen(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
      backgroundColor: Colors.black,
    );
  }
}

