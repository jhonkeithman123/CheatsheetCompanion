import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/cheat_entry.dart';

class DataLoader {
  static Future<List<CheatEntry>> loadCheatSheet(String fileName) async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/$fileName',
    );
    print("Loaded  JSON: $jsonString");
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) => CheatEntry.fromJson(item)).toList();
  }
}
