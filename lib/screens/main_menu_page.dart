import 'package:flutter/material.dart';
import './gas_station_modal.dart';
import './user_login_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

    dynamic getGasStationDetails(){
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
        centerTitle: true,
        backgroundColor: const Color(0xFF2C519C),
        elevation: 0,
        title: const Text(
          'Меню',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF2C519C),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MenuButton(
                      icon: Icons.person_outline,
                      text: 'Личный кабинет',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(title: 'Логин'),
                          ),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(title: 'Логин'),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.1),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: IconButton(
                icon: Icon(Icons.local_gas_station, color: Colors.white),
                iconSize: 50,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGasStationInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => GasStationInfoModal(
        gasStationDetails: getGasStationDetails()
      ),
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
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
