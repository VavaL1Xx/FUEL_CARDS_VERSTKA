import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;

  List<LatLng> get _mapPoints => const [
        LatLng(54.733026, 55.951172),
        LatLng(54.724864, 55.940922),
        LatLng(54.698780, 55.984311)
      ];

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: FlutterMap(
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
            markers: _getMarkers(_mapPoints),
          ),
        ],
      ),
    );
  }

  /// Метод генерации маркеров
  List<Marker> _getMarkers(List<LatLng> mapPoints) {
    return List.generate(
      mapPoints.length,
      (index) => Marker(
        rotate: true,
        point: mapPoints[index],
        width: 30,
        height: 30,
        child: GestureDetector(
          onTap: () {
            _mapController.move(_mapPoints[index], 15);
            _showMarkerInfo(context, index);
          },
          child: Image.asset('assets/png/lukoil.png'),
        ),
      ),
    );
  }

  /// Метод для отображения информации о маркере
  void _showMarkerInfo(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Маркер $index: ${_mapPoints[index]}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}