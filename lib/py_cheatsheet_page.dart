import 'package:flutter/material.dart';
import 'models/cheat_entry.dart';
import 'utils/data_loader.dart';
import 'widgets/cheat_card.dart';

class PyCheatSheetPage extends StatelessWidget {
  const PyCheatSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Python Cheatsheet')),
      body: FutureBuilder<List<CheatEntry>>(
        future: DataLoader.loadCheatSheet("py_cheatsheet.json"),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found."));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              children: snapshot.data!
                  .map((entry) => CheatCard(entry: entry))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
