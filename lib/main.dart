import 'package:api_with_provider/Screens/HomeScreen.dart';
import 'package:api_with_provider/providers/homescreenprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API WITH PROVIDER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
          child: HomeScreen()),
    );
  }
}
