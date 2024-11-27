import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/payment_details_widget.dart';
import '../widgets/insert_pistol_widget.dart';

class GasStationPage extends StatefulWidget {
  const GasStationPage({super.key, required this.gasStationDetail});

  final dynamic gasStationDetail;

  @override
  State<GasStationPage> createState() => _GasStationPageState();
}

class _GasStationPageState extends State<GasStationPage> {
  int _selectedFuelingPointId = 1;
  bool _isFilling = false;

  @override
void initState() {
  super.initState();
  // Сортируем колонки по порядку и устанавливаем первую как выбранную
  widget.gasStationDetail['fueling_points'].sort((a, b) => 
    int.parse(a['fueling_point_number'].toString()).compareTo(
      int.parse(b['fueling_point_number'].toString())
    )
  );
  
  // Устанавливаем первую колонку как выбранную при инициализации
  if (widget.gasStationDetail['fueling_points'].isNotEmpty) {
    _selectedFuelingPointId = widget.gasStationDetail['fueling_points'].first['fueling_point_id'];
  }
}

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.gasStationDetail["azs_adress"],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
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
                          ),
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
              const Text(
                'Колонки',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: widget.gasStationDetail['fueling_points'].map<Widget>((fuelingPoint) {
                  final int pointNumber = fuelingPoint['fueling_point_number'];
                  final int pointId = fuelingPoint['fueling_point_id'];

                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.285, // Около 30% ширины экрана
                      maxWidth: MediaQuery.of(context).size.width * 0.285,
                      minHeight: 60, // Фиксированная высота
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedFuelingPointId = pointId;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedFuelingPointId == pointId
                            ? const Color(0xFF3258A2)
                            : Colors.white,
                        foregroundColor: _selectedFuelingPointId == pointId
                            ? Colors.white
                            : const Color(0xFF3258A2),
                        side: const BorderSide(color: Color(0xFF3258A2)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      ),
                      child: Text(pointNumber.toString(), style: const TextStyle(fontSize: 20)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              if (!_isFilling) ...[
                PaymentDetailsWidget(
                  selectedButton: _selectedFuelingPointId,
                  fuelList: widget.gasStationDetail['fueling_points']
                      .firstWhere((point) => point['fueling_point_id'] == _selectedFuelingPointId)['fuel_list'],
                  onPaymentPressed: () {
                    setState(() {
                      _isFilling = true;
                    });
                  },
                ),
              ] else ...[
                const InsertPistolWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
