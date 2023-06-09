import 'package:fitness_app/Pages/home_page.dart';
import 'package:fitness_app/modules/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WorkoutData(),
    child: const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    ),
    );
  }
}

