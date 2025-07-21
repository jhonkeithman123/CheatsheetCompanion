import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/data_loader.dart';
import 'widgets/cheatsheet_view.dart';
import 'theme_notifier.dart';

class CCheatsheetPage extends StatelessWidget {
  const CCheatsheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final currentTheme = themeNotifier.mode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('C Cheatsheet'),
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.pallet),
            onSelected: themeNotifier.updateTheme,
            itemBuilder: (context) => [
              buildMenuItem(ThemeMode.light, currentTheme),
              buildMenuItem(ThemeMode.dark, currentTheme),
              buildMenuItem(ThemeMode.system, currentTheme),
            ],
          ),
        ],
      ),
      body: CheatsheetView(
        future: DataLoader.loadCheatSheet("c_cheatsheet.json"),
      ),
    );
  }
}
