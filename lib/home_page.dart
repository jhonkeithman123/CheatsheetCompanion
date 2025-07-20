import 'package:flutter/material.dart';
import 'c_cheatsheet_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cheatsheet Companion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/data/cheatsheet.png',
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 16),
            const Text(
              'Cheatsheet Companion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your modular syntax reference for C, Python, and more.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CCheatsheetPage()),
                );
              },
              child: const Text('View C Cheatsheet'),
            ),
          ],
        ),
      ),
    );
  }
}
