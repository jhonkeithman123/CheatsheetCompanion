import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/cheat_entry.dart';

class CheatCard extends StatefulWidget {
  final CheatEntry entry;

  const CheatCard({super.key, required this.entry});

  @override
  State<CheatCard> createState() => _CheatCardState();
}

class _CheatCardState extends State<CheatCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.entry.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "Category: ${widget.entry.category}",
                style: const TextStyle(color: Colors.grey),
              ),

              if (widget.entry.difficulty != null)
                Text(
                  "Difficulty: ${widget.entry.difficulty}",
                  style: const TextStyle(color: Colors.grey),
                ),

              if (_expanded) ...[
                const SizedBox(height: 12),
                Text("Syntax:", style: Theme.of(context).textTheme.labelLarge),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFF1E2A38)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.blueGrey.shade700
                          : Colors.grey.shade400,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.black.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.3),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      widget.entry.syntax!,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        color: isDarkMode
                            ? const Color(0xFF9CDCFE)
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Text("Notes:", style: Theme.of(context).textTheme.labelLarge),
                Text(widget.entry.notes, style: const TextStyle(fontSize: 15)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
