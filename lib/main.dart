import 'package:flutter/material.dart';
import 'home_page.dart';
import 'models/cheat_entry.dart';
import 'utils/data_loader.dart';
import 'widgets/cheat_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Cheatsheet App', home: const HomePage());
  }
}
