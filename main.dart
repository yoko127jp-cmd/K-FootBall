import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        app: AppBar(title: const Text('K-Football App')),
        body: const Center(
          child: Text('ဘောလုံး App စတင်နေပါပြီ'),
        ),
      ),
    );
  }
}
