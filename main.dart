import 'package:flutter/material.dart';

void main() {
  runApp(const KFootballApp());
}

class KFootballApp extends StatelessWidget {
  const KFootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K-Football',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('ပွဲစဉ်ဇယားများ (Fixtures)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    Center(child: Text('တိုက်ရိုက်ရလဒ်များ (Live Scores)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    Center(child: Text('အမှတ်ပေးဇယား (Standings)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: AppBar(
        title: const Text('K-Football Live'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'ပွဲစဉ်များ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Live Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'အမှတ်ပေးဇယား',
          ),
        ],
      ),
    );
  }
}
