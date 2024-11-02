import 'package:flutter/material.dart';
import '../widgets/payment_details_widget.dart';
import '../widgets/insert_pistol_widget.dart';


class GasStationPage extends StatefulWidget {
  const GasStationPage({super.key, required this.title});

  final String title;

  @override
  State<GasStationPage> createState() => _GasStationPageState();
}

class _GasStationPageState extends State<GasStationPage> {
  int _selectedButton = 1;
  bool _isFilling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF3258A2)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              children: [

                const Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'г. Уфа, ул. Ленина, д. 70',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Скругление углов
                    child: Image.asset(
                      'assets/jpg/map.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              
                const SizedBox(height: 20),

                const Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Колонка',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedButton = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedButton == 1 ? const Color(0xFF3258A2) : Colors.white,
                          foregroundColor: _selectedButton == 1 ? Colors.white : const Color(0xFF3258A2),
                          side: const BorderSide(color: Color(0xFF3258A2)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          minimumSize: const Size(224,80),
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: const Text('1'),
                      ), 
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedButton = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedButton == 2 ? const Color(0xFF3258A2) : Colors.white,
                          foregroundColor: _selectedButton == 2 ? Colors.white : const Color(0xFF3258A2),
                          side: const BorderSide(color: Color(0xFF3258A2)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          minimumSize: const Size(224,80),
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: const Text('2'),
                      ), 
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedButton = 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedButton == 3 ? const Color(0xFF3258A2) : Colors.white,
                          foregroundColor: _selectedButton == 3 ? Colors.white : const Color(0xFF3258A2),
                          side: const BorderSide(color: Color(0xFF3258A2)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          minimumSize: const Size(224,80),
                          textStyle: const TextStyle(fontSize: 28),
                        ),
                        child: const Text('3'),
                      ), 
                    ),
                  ],
                  ),
                  const SizedBox(height: 20),
                  if (!_isFilling) ...[
                    PaymentDetailsWidget(
                      selectedButton: _selectedButton,
                      onPaymentPressed: () {
                      setState(() {
                        _isFilling = true; // Изменяем состояние
                      });
                      }
                    ),
                  ] else ...[
                    InsertPistolWidget(),
                  ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}