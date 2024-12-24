import 'package:flutter/material.dart';
import 'package:multiple_bloc/features/home/ui/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiple Bloc App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(cardColor: Colors.teal),
      ),
      home: Home(),
    );
  }
}
