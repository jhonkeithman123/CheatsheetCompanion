import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;

  void updateTheme(ThemeMode newMode) {
    _mode = newMode;
    notifyListeners();
  }
}

PopupMenuItem<ThemeMode> buildMenuItem(ThemeMode mode, ThemeMode currentTheme) {
  final isSelected = currentTheme == mode;
  final modeLabel = mode == ThemeMode.system
      ? 'Follow System'
      : '${mode.name[0].toUpperCase()}${mode.name.substring(1)} Mode';

  return PopupMenuItem(
    value: mode,
    child: Row(
      children: [
        if (isSelected) const Icon(Icons.check, size: 18, color: Colors.blue),
        const SizedBox(width: 8),
        Text(
          modeLabel,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
