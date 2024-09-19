import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<Map<String, dynamic>> _dailyEntries = [];

  @override
  void initState() {
    super.initState();
    _loadDailyEntries();
  }

  Future<void> _loadDailyEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyEntriesJson = prefs.getStringList('daily_entries') ?? [];

    setState(() {
      _dailyEntries = dailyEntriesJson
          .map((entryJson) => Map<String, dynamic>.from(entryJson as Map))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistiques"),
      ),
      body: ListView.builder(
        itemCount: _dailyEntries.length,
        itemBuilder: (context, index) {
          final entry = _dailyEntries[index];
          final date = entry['date'];
          final totalAmount = entry['totalAmount'];

          return ListTile(
            title: Text(date),
            subtitle: Text('Total: $totalAmount'),
          );
        },
      ),
    );
  }
}
