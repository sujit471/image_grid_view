import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/photo_provider.dart';
import 'screens/Gridview.dart';

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
        home: PhotoGridScreen(),
      ),
    );
  }
}
