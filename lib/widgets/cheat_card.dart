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

              if (widget.entry.syntax != null) ...[
                const SizedBox(height: 12),
                Text("Syntax:", style: Theme.of(context).textTheme.labelLarge),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      widget.entry.syntax!,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
