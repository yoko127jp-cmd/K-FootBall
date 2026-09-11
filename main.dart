import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FixturesScreen(),
    const LiveScoresScreen(),
    const StandingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: AppBar(
        title: const Text('K-Football Live App'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: _screens[_currentIndex],
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

// ၁။ ပွဲစဉ်ဇယား Screen
class FixturesScreen extends StatelessWidget {
  const FixturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.sports_soccer, color: Colors.green),
            title: Text('အသင်း A vs အသင်း B (ပွဲစဉ် ${index + 1})'),
            subtitle: const Text('ရက်စွဲ: မနက်ဖြန် - ည ၁၀:၀၀ နာရီ'),
            trailing: const Text('Upcoming', style: TextStyle(color: Colors.blue)),
          ),
        );
      },
    );
  }
}

// ၂။ Live Scores Screen
class LiveScoresScreen extends StatefulWidget {
  const LiveScoresScreen({super.key});

  @override
  State<LiveScoresScreen> createState() => _LiveScoresScreenState();
}

class _LiveScoresScreenState extends State<LiveScoresScreen> {
  // တိုက်ရိုက်ရလဒ် အချက်အလက်များ ပြသရန်
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          color: Colors.green[50],
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("🔴 LIVE - ပွဲကစားဆဲ", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("မန်ချက်စတာယူနိုက်တက်", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(" 2 - 1 ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    Text("လီဗာပူးလ်", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 4),
                Text("ပွဲချိန်: 75'", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ၃။ အမှတ်ပေးဇယား Screen
class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  @appTableData()
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        DataTable(
          columns: const [
            DataColumn(label: Text('အဆင့်')),
            DataColumn(label: Text('အသင်း')),
            DataColumn(label: Text('ပွဲ')),
            DataColumn(label: Text('ရမှတ်')),
          ],
          rows: const [
            DataRow(cells: [DataCell(Text('1')), DataCell(Text('Arsenal')), DataCell(Text('28')), DataCell(Text('64'))]),
            DataRow(cells: [DataCell(Text('2')), DataCell(Text('Man City')), DataCell(Text('28')), DataCell(Text('63'))]),
            DataRow(cells: [DataCell(Text('3')), DataCell(Text('Liverpool')), DataCell(Text('28')), DataCell(Text('60'))]),
          ],
        ),
      ],
    );
  }
}
