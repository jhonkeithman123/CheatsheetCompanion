import 'package:flutter/material.dart';
import 'models/cheat_entry.dart';
import 'utils/data_loader.dart';
import 'widgets/cheat_card.dart';

class CCheatsheetPage extends StatelessWidget {
  const CCheatsheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C Cheatsheet')),
      body: FutureBuilder<List<CheatEntry>>(
        future: DataLoader.loadCheatSheet("c_cheatsheet.json"),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found."));
          }

          final Map<String, List<CheatEntry>> groupedByCategory = {};
          for (final entry in snapshot.data!) {
            groupedByCategory.putIfAbsent(entry.category, () => []).add(entry);
          }

          Map<String, Map<String, List<CheatEntry>>> difficultyMap = {};

          for (final entry in snapshot.data!) {
            final difficulty = entry.difficulty ?? "Uncategorized";
            final category = entry.category;

            difficultyMap.putIfAbsent(difficulty, () => {});
            difficultyMap[difficulty]!.putIfAbsent(category, () => []);
            difficultyMap[difficulty]![category]!.add(entry);
          }

          return ListView(
            padding: const EdgeInsets.all(12),
            children: difficultyMap.entries.map((difficultyGroup) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '=== ${difficultyGroup.key.toUpperCase()} ===',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  ...difficultyGroup.value.entries.map((categoryGroup) {
                    final sortedEntries = [...categoryGroup.value]
                      ..sort((a, b) => a.title.compareTo(b.title));

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            '----- ${categoryGroup.key} -----',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        ...sortedEntries.map(
                          (entry) => CheatCard(entry: entry),
                        ),
                      ],
                    );
                  }),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
