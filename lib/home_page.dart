import 'package:flutter/material.dart';
import 'c_cheatsheet_page.dart';
import 'py_cheatsheet_page.dart';

class HomePage extends StatelessWidget {
  final void Function(ThemeMode) toggleTheme;
  final ThemeMode currentTheme;

  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheatsheet Companion'),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.pallet),
            onSelected: (mode) => toggleTheme(mode),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    if (currentTheme == ThemeMode.light)
                      const Icon(Icons.check, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Light Mode',
                      style: TextStyle(
                        fontWeight: currentTheme == ThemeMode.light
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    if (currentTheme == ThemeMode.dark)
                      const Icon(Icons.check, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontWeight: currentTheme == ThemeMode.dark
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    if (currentTheme == ThemeMode.system)
                      const Icon(Icons.check, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Folow System',
                      style: TextStyle(
                        fontWeight: currentTheme == ThemeMode.system
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/data/cheatsheet.png', height: 70),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cheatsheet Companion',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Your modular syntax referance for C, Python, and more. A fast, offline-ready toolkit for syntax, structure, and notes — built by devs for devs.',
                        style: TextStyle(fontSize: 16),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CCheatsheetPage(),
                      ),
                    );
                  },
                  child: const Text('View C Cheatsheet'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PyCheatSheetPage(),
                      ),
                    );
                  },
                  child: const Text('View Python Cheatsheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
