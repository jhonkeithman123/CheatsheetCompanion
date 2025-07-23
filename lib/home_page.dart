import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme_notifier.dart';
import 'c_cheatsheet_page.dart';
import 'py_cheatsheet_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final currrentTheme = themeNotifier.mode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheatsheet Companion'),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.pallet),
            onSelected: themeNotifier.updateTheme,
            itemBuilder: (context) => [
              buildMenuItem(ThemeMode.light, currrentTheme),
              buildMenuItem(ThemeMode.dark, currrentTheme),
              buildMenuItem(ThemeMode.system, currrentTheme),
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
                        'Your modular syntax referance for C, Python, and more. A fast, offline-ready toolkit for syntax, structure, and notes — built by jhonkeithman123.',
                        style: TextStyle(fontSize: 16),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => launchUrl(
                          Uri.parse(
                            'https://github.com/jhonkeithman123/CheatsheetCompanion',
                          ),
                          mode: LaunchMode.externalApplication,
                        ),
                        child: Text(
                          'Visit the Github repository.',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
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
