import 'package:flutter/material.dart';
import '../screens/payment_success.dart';

class InsertPistolWidget extends StatefulWidget {
  const InsertPistolWidget({Key? key}) : super(key: key);

  @override
  State<InsertPistolWidget> createState() => _InsertPistolWidgetState();
}

class _InsertPistolWidgetState extends State<InsertPistolWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Информационный блок
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF4FB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.info_outline,
                  color: Color(0xFF3258A2),
                  size: 64,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Вставьте\nпистолет в бак',
                style: TextStyle(
                  color: Color(0xFF3258A2),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Кнопка
        ElevatedButton(
          onPressed: onInsertPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3258A2),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(double.infinity, 48),
          ),
          child: const Text(
            'Вставить пистолет',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void onInsertPressed() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3258A2)),
                ),
                 SizedBox(height: 20),
                 Text(
                  'Подождите...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3258A2),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;
    Navigator.of(context).pop(); // Закрываем диалог
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
    );
  }
}