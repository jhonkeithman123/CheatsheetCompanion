import 'package:flutter/material.dart';
import '../models/cheat_entry.dart';
import 'cheat_card.dart';

class CheatsheetView extends StatelessWidget {
  final Future<List<CheatEntry>> future;
  final String emptyMessage;

  const CheatsheetView({
    super.key,
    required this.future,
    this.emptyMessage = "No data found.",
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CheatEntry>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text(emptyMessage));
        }

        final Map<String, Map<String, List<CheatEntry>>> difficultyMap = {};

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
                      ...sortedEntries.map((entry) => CheatCard(entry: entry)),
                    ],
                  );
                }),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
