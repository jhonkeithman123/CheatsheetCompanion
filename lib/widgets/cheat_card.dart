import 'package:flutter/material.dart';
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

              if (_expanded) ...[
                const SizedBox(height: 12),
                Text("Syntax:", style: Theme.of(context).textTheme.labelLarge),
                Text(
                  widget.entry.syntax,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
                const SizedBox(height: 8),
                Text("Notes:", style: Theme.of(context).textTheme.labelLarge),
                Text(widget.entry.notes),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
