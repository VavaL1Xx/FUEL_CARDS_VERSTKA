import 'package:flutter/material.dart';
import 'screens/main_menu_page.dart';

void main() {
  runApp(const FuelCardsApp());
}

class FuelCardsApp extends StatelessWidget {
  const FuelCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF2C519C)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const MainMenuPage()),
                );
          },
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: const Center(
        child: Text('Это главная страцниа приложения.\nНажмите на бургер вверху для открытия меню.'),
      ),
    );
  }
}
