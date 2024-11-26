import 'package:flutter/material.dart';
import './gas_station_map.dart';
import './user_login_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

    static dynamic getGasStationDetails(){
    return {
      "azs_config_date": "2023-06-06T11:34:30.490+03:00",
      "pos_config": [
        {
          "pos_id": 452000000001122,
          "pos_name": "POS 5",
        },
        {
          "pos_id": 452000000003262,
          "pos_name": "POS 8",
        },
        {
          "pos_id": 452000000016066,
          "pos_name": "POS 11",
        },
        {
          "pos_id": 989000000006419,
          "pos_name": "server",
        },
        {
            "pos_id": 989000000006420,
            "pos_name": "POS 1"
        },
        {
            "pos_id": 989000000019383,
            "pos_name": "POS 2"
        },
        {
            "pos_id": 989000000019384,
            "pos_name": "POS 3"
        }
    ],
    "azs_name": "АЗС 533",
    "azs_adress": "Москва, АЗС № 77598 терминал  VI999997",
    "azs_longitude": 37.65662,
    "azs_latitude": 55.83755,
    "postpay": true,
    "npo_key": 1,
    "response_code": 0,
    "response_message": "API.getAzsConfigurationById. Успешно",
    "fueling_points": [
        {
            "fueling_point_id": 989000000015361,
            "fueling_point_number": 1,
            "status_fp": 0,
            "postpay": null,
            "unpaid": null,
            "fuel_list": [
                {
                    "nozzle_id": 452000000000162,
                    "nozzle_name": "50",
                    "product_id": 989000000022821,
                    "product_name": "ДТ Э",
                    "product_price": 5990,
                    "amount_min": 1,
                    "quantity_min": 1000,
                    "quantity_max": 9999000,
                    "status_nz": 0,
                    "product_ksss": "null",
                    "postpay": true
                },
                {
                    "nozzle_id": 989000000029685,
                    "nozzle_name": "1",
                    "product_id": 989000000083806,
                    "product_name": "ДТ Е",
                    "product_price": 5000,
                    "amount_min": 1,
                    "quantity_min": 1000,
                    "quantity_max": 9999000,
                    "status_nz": 0,
                    "product_ksss": "null",
                    "postpay": true
                },
                {
                    "nozzle_id": 989000000029687,
                    "nozzle_name": "3",
                    "product_id": 101000000002341,
                    "product_name": "АИ-92",
                    "product_price": 4813,
                    "amount_min": 1,
                    "quantity_min": 1000,
                    "quantity_max": 9999000,
                    "status_nz": 0,
                    "product_ksss": "null",
                    "postpay": true
                },
                {
                    "nozzle_id": 989000000029686,
                    "nozzle_name": "2",
                    "product_id": 989000000022541,
                    "product_name": "95 Е",
                    "product_price": 3550,
                    "amount_min": 1,
                    "quantity_min": 1000,
                    "quantity_max": 9999000,
                    "status_nz": 0,
                    "product_ksss": "null",
                    "postpay": false
                },
                {
                    "nozzle_id": 989000000029688,
                    "nozzle_name": "4",
                    "product_id": 989000000001082,
                    "product_name": "95 Э",
                    "product_price": 4990,
                    "amount_min": 1,
                    "quantity_min": 1000,
                    "quantity_max": 9999000,
                    "status_nz": 0,
                    "product_ksss": "null",
                    "postpay": true
                }
            ]
        },
    ],
    "azs_limit": {
        "amount_step": 1,
        "quantity_step": 10,
        "start_fuel_timeout": 120000
    }
 };
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color(0xFF2C519C),
      automaticallyImplyLeading: false, // Убирает стандартную кнопку "назад"
      toolbarHeight: 96,
      flexibleSpace: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
        alignment: Alignment.bottomCenter, // Выравнивание контента по нижнему краю
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 7),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.menu, 
                  color: Colors.white,
                  size: 32, 
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Text(
              'Карта',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 7),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined, 
                  color: Colors.white,
                  size: 32, 
                  ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const MainMenuPage()),
                );
                },
              ),
            ),
          ],
        ),
      ),
    ),
      body: Container(
        color: const Color(0xFF2C519C), // Устанавливаем синий фон
        child: Column(
          children: [
            const SizedBox(height: 50), // Отступ между меню и блоком с элементами
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    image: Image.asset(
                      'assets/png/Profile.png', // Фото для личного кабинета
                      width: 14.35,
                      height: 16.6,
                      color: Colors.white, // Цветовое наложение (по необходимости)
                    ),
                    title: 'Личный кабинет',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(title: 'Логин'),
                          ),
                        );
                    }
                  ),
                  _buildMenuItem(
                    image: Image.asset(
                      'assets/png/Group.png', // Фото для топливных карт
                      width: 19.57,
                      height: 18.11,
                      color: Colors.white, // Цветовое наложение (по необходимости)
                    ),
                    title: 'Топливные карты',
                    onTap: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MapScreen(),
                                      ),
                                    );
                    }
                  ),
                  _buildMenuItem(
                    image: Image.asset(
                      'assets/png/Wallet.png', // Фото для операций по счету
                      width: 18.01,
                      height: 15,
                      color: Colors.white, // Цветовое наложение (по необходимости)
                    ),
                    title: 'Операции по счету',
                    onTap: (){},
                  ),
                  // _buildMenuItem(
                  //   image: Image.asset(
                  //     'assets/png/Chart.png', // Фото для операций по карте
                  //     width: 18.01,
                  //     height: 16.67,
                  //     color: Colors.white, // Цветовое наложение (по необходимости)
                  //   ),
                  //   title: 'Операции по карте',
                  //   onTap: (){},
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Изменяем ширину кнопки
                  Align(
                    alignment: Alignment.center, // Центрируем кнопку
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C519C), // Цвет фона кнопки
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120), // Меньше отступы по бокам
                        elevation: 0, // Убираем тень
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Радиус углов
                          side: const BorderSide(color: Colors.white), // Белая рамка
                        ),
                      ),
                      child: const Text(
                        'Выйти',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Цвет текста кнопки
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white, // Белый фон для круга
                      shape: BoxShape.circle, // Делаем круг
                    ),
                    child: ClipOval( // Обрезаем изображение по форме круга
                      child: Image.asset(
                        'assets/jpg/Frame.jpg', // Укажите путь к вашему изображению
                        fit: BoxFit.cover, // Обеспечиваем заполнение круга изображением
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

    
  Widget _buildMenuItem({
  required Image image,
  required String title,
  required VoidCallback onTap,
}) {
  // bool isHovered = false; // Переменная для хранения состояния наведения
  // isHovered ? Colors.white24 :
  return MouseRegion(
    onEnter: (_) {
      // isHovered = true;
      // Здесь можно вызвать setState, если состояние изменяется
    },
    onExit: (_) {
      // isHovered = false;
      // Здесь можно вызвать setState, если состояние изменяется
    },
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 48, 89, 171),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: image,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 64), // Отступ до начала линии
                height: 1,
                color: Colors.white,
            ),
            ),
          ],
        ),
      ),
    ),
  );
}
}

// class MenuButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onTap;

//   const MenuButton({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white.withOpacity(0.1),
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//         leading: Icon(
//           icon,
//           color: Colors.white,
//           size: 24,
//         ),
//         title: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
