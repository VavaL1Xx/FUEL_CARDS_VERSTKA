import 'package:flutter/material.dart';

void main() {
  runApp(const FuelCardsApp());
}

class FuelCardsApp extends StatelessWidget {
  const FuelCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Главная',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const MainMenuPage(title: 'Меню'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _gasStationNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _gasStationNumber++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AZSPage(title: 'АЗС № $_gasStationNumber'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3258A2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Страница АЗС'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _gasStationNumber++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(title: 'Логин'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3258A2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Кнопочки'),
            ),

          ],
        ), 
      ),
    );
  }
}

class AZSPage extends StatefulWidget {
  const AZSPage({super.key, required this.title});

  final String title;

  @override
  State<AZSPage> createState() => _AZSPageState();
}

class _AZSPageState extends State<AZSPage> {
  int _selectedButton = 1;

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
                  Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Колонка № $_selectedButton',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration:   BoxDecoration(
                            color: _selectedButton != 2 ? const Color(0xFFE6F1F8) : const Color(0xFFF3F3F3),
                            borderRadius: const BorderRadius.all(Radius.circular(8)), // Скругление границ
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Внутренние отступы
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Объем', style: TextStyle(fontSize: 16)),
                              Text(
                                _selectedButton != 2 ? '5 л' : '0 л', 
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
                            color: _selectedButton != 2 ? const Color(0xFFE6F1F8) : const Color(0xFFF3F3F3),
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: const  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Топливо', style: TextStyle(fontSize: 16)),
                              Text(
                                _selectedButton != 2 ? '5 л' : '-', 
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
                        color: _selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5),
                        width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('СУММА К ОПЛАТЕ:', style: TextStyle(color:_selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5), fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(_selectedButton != 2 ? '1 400,25 ₽' : '-', style: TextStyle(color:_selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5), fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  if (!(_selectedButton == 2))...[
                    const Text(
                      'Если обнаружится недостаточное количество товара, система автоматически отменит операцию и произведёт перерасчёт.',
                      style: TextStyle(
                        color: Color(0xFF747474),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5),
                          foregroundColor: Colors.white,
                          side: BorderSide(color: _selectedButton != 2 ? const Color(0xFF3258A2) : const Color(0xFFC5C5C5)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';

  void _handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Пожалуйста, заполните все поля';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return; // Проверка на то, что виджет все еще смонтирован

      if (usernameController.text == 'admin' && passwordController.text == 'password') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainMenuPage(title: 'Меню')),
        );
      } else {
        if (mounted) {
          setState(() {
            errorMessage = 'Неверное имя пользователя или пароль';
          });
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Произошла ошибка при входе';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Вход в систему', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2C519C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const SizedBox(height: 40),
            const Icon(
              Icons.local_gas_station,
              size: 100,
              color: Color(0xFF2C519C),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Имя пользователя',
                labelStyle: const TextStyle(color: Color(0xFF2C519C)),
                prefixIcon: const Icon(Icons.person, color: Color(0xFF2C519C)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF2C519C), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                labelStyle: const TextStyle(color: Color(0xFF2C519C)),
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF2C519C)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF2C519C), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C519C),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: isLoading ? null : _handleLogin,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Войти',
                      style: TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:const Color(0xFF2C519C),
        elevation: 0,
        title: const Text(
          'Меню',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color:const Color(0xFF2C519C),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    MenuButton(
                      icon: Icons.person_outline,
                      text: 'Личный кабинет',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage(title: 'Логин')),
                        );
                      },
                    ),
                    MenuButton(
                      icon: Icons.credit_card,
                      text: 'Топливные карты',
                      onTap: () => _showGasStationInfo(context),
                    ),
                    MenuButton(
                      icon: Icons.account_balance_wallet_outlined,
                      text: 'Операция по счету',
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.credit_card_outlined,
                      text: 'Операция по карте',
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.check_circle_outline,
                      text: 'Заказ оплачен',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 200, // Фиксированная ширина для всех кнопок
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage(title: 'Логин')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Выйти',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Функция для показа модального окна
  void _showGasStationInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => const GasStationInfoModal(),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}


class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C519C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 24),
            const Text(
              'Заказ оплачен',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF2C519C),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Назад в личный кабинет',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage(title: 'Логин')),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Выйти',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Создаем отдельный класс для модального окна
class GasStationInfoModal extends StatelessWidget {
  const GasStationInfoModal({super.key});

  // Вспомогательный метод для создания карточки с информацией о топливе
  Widget _buildFuelCard(String name, String price) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(name),
            const SizedBox(height: 4),
            Text(price),
          ],
        ),
      ),
    );
  }

  // Вспомогательный метод для создания чипа со способом оплаты
  Widget _buildPaymentMethodChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'АЗС № 00000',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('г. Уфа, ул. Ленина, д. 70'),
                          const SizedBox(height: 8),
                          const Text('Расстояние до АЗС: 2.4 км'),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Маршруты'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AZSPage(title: 'АЗС')),
                                  );
                                },
                                child: const Text('Заправиться'),
                              ),
                            ],
                          ),
                          const Divider(height: 32),
                          const Text(
                                'Топливо и цены', // Заголовок секции
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                  'на 00:00 08.10.2024 (московское время)'), // Время обновления информации
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildFuelCard('95 ЭКТО',
                                      '61.25 ₽'), // Карточка с информацией о топливе
                                  _buildFuelCard('ДТ ЭКТО', '66.02 ₽'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Информация о ценах на топливо не является публичной офертой.',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors
                                        .grey), // Мелкий шрифт для примечания
                              ),
                              const SizedBox(height: 16),
                              ListTile(
                                title: const Text(
                                    'Об инновационной линейке ЭКТО'), // Элемент списка
                                trailing:
                                    const Icon(Icons.arrow_forward), // Стрелка справа
                                onTap: () {}, // Действие при нажатии на элемент
                              ),
                              const Divider(height: 32),
                              const Text(
                                'Способ оплаты', // Заголовок секции
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8, // Расстояние между элементами
                                runSpacing: 8, // Расстояние между строками
                                children: [
                                  _buildPaymentMethodChip(
                                      'Безналичный расчет'), // Чип с информацией о способе оплаты
                                  _buildPaymentMethodChip(
                                      'Бесконтактные платежи'),
                                  _buildPaymentMethodChip('Топливные карты'),
                                ],
                              ),
                              const Divider(height: 32),
                              const Text(
                                'Услуги', // Заголовок секции
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const ListTile(
                                title: Text(
                                    'Автомойка'), // Элемент списка с услугой
                              ),
                              const Divider(height: 32),
                              ListTile(
                                title: const Text(
                                    'Написать отзыв'), // Элемент списка для написания отзыва
                                trailing:
                                    const Icon(Icons.arrow_forward), // Стрелка справа
                                onTap: () {},
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}