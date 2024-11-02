import 'package:flutter/material.dart';

class PaymentDetailsWidget extends StatelessWidget {
  final int selectedButton;
  final VoidCallback onPaymentPressed;

  // Конструктор с обязательным параметром
  const PaymentDetailsWidget({
    Key? key, 
    required this.selectedButton,
    required this.onPaymentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Колонка № $selectedButton',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration:   BoxDecoration(
                            color: selectedButton != 2 ? const Color(0xFFE6F1F8) : const Color(0xFFF3F3F3),
                            borderRadius: const BorderRadius.all(Radius.circular(8)), // Скругление границ
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Внутренние отступы
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Объем', style: TextStyle(fontSize: 16)),
                              Text(
                                selectedButton != 2 ? '5 л' : '0 л', 
                                style: const TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.bold
                                  )
                                ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 10), // Отступ между контейнерами
                        
                        Container(
                          decoration: BoxDecoration(
                            color: selectedButton != 2 ? const Color(0xFFE6F1F8) : const Color(0xFFF3F3F3),
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: const  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Топливо', style: TextStyle(fontSize: 16)),
                              Text(
                                selectedButton != 2 ? '5 л' : '-', 
                                style: const TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.bold
                                  )
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5),
                        width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('СУММА К ОПЛАТЕ:', style: TextStyle(color:selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5), fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(selectedButton != 2 ? '1 400,25 ₽' : '-', style: TextStyle(color:selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5), fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  if (!(selectedButton == 2))...[
                    const Text(
                      'Если обнаружится недостаточное количество товара, система автоматически отменит операцию и произведёт перерасчёт.',
                      style: TextStyle(
                        color: Color(0xFF747474),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          selectedButton != 2 ? onPaymentPressed() : null;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5),
                          foregroundColor: Colors.white,
                          side: BorderSide(color: selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text('Оплатить заказ'),
                      ), 
                  )
        ]
      );
  }
  }
