import 'package:flutter/material.dart';
import 'package:fuel_cards/screens/main_menu_page.dart';
import 'package:fuel_cards/screens/user_login_page.dart';
import 'package:fuel_cards/screens/auth_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authStorage = AuthStorage();

  // Проверяем наличие токена при запуске
  final String? token = await authStorage.getToken();

  runApp(FuelCardsApp(isAuthorized: token != null));
}

class FuelCardsApp extends StatelessWidget {
  final bool isAuthorized;

  const FuelCardsApp({super.key, required this.isAuthorized});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: isAuthorized ? const MainMenuPage() : const LoginPage(title: 'Вход'),
    );
  }
}
