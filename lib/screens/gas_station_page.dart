import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import '../widgets/payment_details_widget.dart';
import '../widgets/insert_pistol_widget.dart';


class GasStationPage extends StatefulWidget {
  const GasStationPage({super.key, required this.gasStationDetail});

  // Симуляция ответа от API
  final dynamic gasStationDetail;

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
        title: Text(widget.gasStationDetail["azs_name"]),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.gasStationDetail["azs_adress"],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        widget.gasStationDetail["azs_latitude"],
                        widget.gasStationDetail["azs_longitude"],
                      ),
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            rotate: true,
                            point: LatLng(
                              widget.gasStationDetail["azs_latitude"],
                              widget.gasStationDetail["azs_longitude"],
                            ), // Используем coordinates из GasStation
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/png/lukoil.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Align (
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Колонки',
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
                        _isFilling = true;
                      });
                      }
                    ),
                  ] else ...[
                   const InsertPistolWidget(),
                  ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

