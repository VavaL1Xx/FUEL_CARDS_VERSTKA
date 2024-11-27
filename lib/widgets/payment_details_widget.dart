import 'package:flutter/material.dart';

class PaymentDetailsWidget extends StatefulWidget {
  final int selectedButton;
  final VoidCallback onPaymentPressed;
  final List<dynamic> fuelList;

  const PaymentDetailsWidget({
    super.key, 
    required this.selectedButton,
    required this.onPaymentPressed,
    required this.fuelList,
  });

  @override
  _PaymentDetailsWidgetState createState() => _PaymentDetailsWidgetState();
}

class _PaymentDetailsWidgetState extends State<PaymentDetailsWidget> {
  late dynamic _selectedFuel;
  double _volume = 5.0;

  @override
  void initState() {
    super.initState();
    // Инициализируем выбор топлива при смене колонки
    _initializeFuelSelection();
  }

  @override
  void didUpdateWidget(PaymentDetailsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Обновляем выбор топлива при смене колонки
    if (oldWidget.selectedButton != widget.selectedButton) {
      _initializeFuelSelection();
    }
  }

  void _initializeFuelSelection() {
  final uniqueFuelList = _getUniqueFuelList(widget.fuelList);

  if (uniqueFuelList.isNotEmpty) {
    _selectedFuel = uniqueFuelList.firstWhere(
      (fuel) => fuel['postpay'] == true,
      orElse: () => uniqueFuelList.first,
    );
  }
}

List<Map<String, dynamic>> _getUniqueFuelList(List<dynamic> fuelList) {
  final seen = <String>{}; // Множество для отслеживания уникальных имен
  return fuelList
      .where((fuel) {
        final fuelMap = fuel as Map<String, dynamic>; // Приведение типа
        return seen.add(fuelMap['product_name']);
      })
      .cast<Map<String, dynamic>>()
      .toList();
}

  @override
  Widget build(BuildContext context) {
    final uniqueFuelList = _getUniqueFuelList(widget.fuelList);

    if (uniqueFuelList.isEmpty) {
      return const Text('Нет доступных типов топлива');
    }

    // Конвертация цены из копеек в рубли
    double priceInRubles = _selectedFuel['product_price'] / 100.0;

    // Расчет общей суммы
    double totalAmount = _volume * priceInRubles;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Колонка № ${widget.selectedButton}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Выбор объема
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE6F1F8),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Объем', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        _volume = (_volume - 1).clamp(1.0, 50.0);
                      });
                    },
                  ),
                  Text('${_volume.toStringAsFixed(1)} л', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _volume = (_volume + 1).clamp(1.0, 50.0);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Выбор типа топлива
        Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE6F1F8),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Топливо', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: uniqueFuelList.any((fuel) => fuel['product_name'] == _selectedFuel['product_name'])
                  ? _selectedFuel['product_name']
                  : null,
              items: uniqueFuelList.map<DropdownMenuItem<String>>((fuel) {
                return DropdownMenuItem<String>(
                  value: fuel['product_name'],
                  child: Text(fuel['product_name']),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFuel = uniqueFuelList.firstWhere(
                    (fuel) => fuel['product_name'] == newValue,
                  );
                });
              },
            ),
          ],
        ),
      ),

        const SizedBox(height: 20),

        // Сумма к оплате
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: const Color(0xFF3258A2), width: 1.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'СУММА К ОПЛАТЕ:', 
                style: TextStyle(
                  color: Color(0xFF3258A2), 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                '${totalAmount.toStringAsFixed(2)} ₽', 
                style: const TextStyle(
                  color: Color(0xFF3258A2), 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          'Если обнаружится недостаточное количество товара, система автоматически отменит операцию и произведёт перерасчёт.',
          style: TextStyle(color: Color(0xFF747474)),
        ),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () => widget.onPaymentPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3258A2),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(double.infinity, 48),
          ),
          child: const Text('Оплатить заказ'),
        ),
      ],
    );
  }
}