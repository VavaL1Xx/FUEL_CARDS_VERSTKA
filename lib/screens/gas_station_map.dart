import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

import './main_menu_page.dart';
import './gas_station_modal.dart';

class GasStation {
  final int id;
  final LatLng coordinates;

  GasStation({
    required this.id,
    required this.coordinates,
  });
}

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;
  List<GasStation> _mapPoints = [];
  bool _isLoading = true;
  String? _errorMessage;
  
  @override
  void initState() {
    _mapController = MapController();
    super.initState();
    _fetchGasStations();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _fetchGasStations() async {
    final url = Uri.parse('https://api-b2b-test.licard.com/smp-provider/api/v1/public/ais/list');
    const String token = 'c8d8a09ce677eb8a5dd6d303342eb184'; // Замените на ваш токен
    try {
      final response = await http.get(
        url,
        headers: {
          'token': token,
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        setState(() {
          _mapPoints = data
    .map<GasStation>((item) => GasStation(
          id: item['azsId'], // Убедитесь, что API возвращает уникальный id
          coordinates: LatLng(
            item['azsCoordinates']['lat'],
            item['azsCoordinates']['lon'],
          ),
        ))
    .toList();
              
          _isLoading = false;
        });
      } else {
        throw Exception('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка загрузки данных: $e';
        _isLoading = false;
      });
    }
  }

Future<Map<String, dynamic>> fetchGasStationDetailsFromMap(BuildContext context, int id) async {
  final url = Uri.parse('https://api-b2b-test.licard.com/smp-provider/api/v1/public/ais/detail').replace(
    queryParameters: {
      'id': id.toString(),
    }
  );
  const String token = 'c8d8a09ce677eb8a5dd6d303342eb184'; // Замените на свой токен

  try {
    final response = await http.get(
      url,
      headers: {
        'token': token,
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      // Проверка кода ответа API
      if (data['response_code'] == 0) {
        return data; // Возвращаем данные
      } else {
        // Показываем диалоговое окно с ошибкой от API
        _showErrorDialog(context, 'Ошибка: ${data['response_message']}');
        return {};
      }
    } else {
      // Показываем диалоговое окно с ошибкой запроса
      _showErrorDialog(context, 'Ошибка запроса: ${response.statusCode}');
      return {};
    }
  } catch (e) {
    // Показываем диалоговое окно с ошибкой подключения
    _showErrorDialog(context, 'Ошибка подключения: $e');
    return {};
  }
}

// Функция для отображения диалогового окна с ошибкой
void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ошибка'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Закрыть'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C519C),
        toolbarHeight: 96,
        flexibleSpace: _buildAppBarContent(context),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Индикатор загрузки
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!)) // Сообщение об ошибке
              : _buildMap(context), // Карта с маркерами
    );
  }

  Widget _buildMap(BuildContext context){
    return FlutterMap(
      mapController: _mapController,
      options: const MapOptions(
        initialCenter: LatLng(54.733026, 55.951172),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_map_example',
        ),
        MarkerLayer(
          markers: _getMarkers(_mapPoints), // _mapPoints уже имеет тип List<GasStation>
        ),
      ],
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF2C519C),
      automaticallyImplyLeading: false,
      toolbarHeight: 96,
      flexibleSpace: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
        alignment: Alignment.bottomCenter,
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
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const MainMenuPage()),
                );
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
  );
}

  List<Marker> _getMarkers(List<GasStation> mapPoints) {
  return List.generate(
    mapPoints.length,
    (index) {
      final gasStation = mapPoints[index];
      return Marker(
        rotate: true,
        point: gasStation.coordinates, // Используем coordinates из GasStation
        width: 30,
        height: 30,
        child: GestureDetector(
          onTap: () {
            _mapController.move(gasStation.coordinates, 15);
            _showGasStationInfo(context, gasStation.id); // Передаем id
          },
          child: Image.asset('assets/png/lukoil.png'),
        ),
      );
    },
  );
}

  void _showGasStationInfo(BuildContext context, int gasStationId) async {
  Map<String, dynamic> gasStationDetails = await fetchGasStationDetailsFromMap(context, gasStationId);
  
  if (gasStationDetails.isNotEmpty) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => GasStationInfoModal(
        gasStationDetails: gasStationDetails,
      ),
    );
  }
}
}