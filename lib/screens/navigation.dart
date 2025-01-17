import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NavigasyonSayfasi extends StatefulWidget {
  const NavigasyonSayfasi({Key? key}) : super(key: key);

  @override
  State<NavigasyonSayfasi> createState() => _NavigasyonSayfasiDurumu();
}

class _NavigasyonSayfasiDurumu extends State<NavigasyonSayfasi> {
  late final MapController _haritaDenetleyici; 
  double _mevcutZoom = 13.0; 
  final LatLng _baslangicKonumu = const LatLng(41.052165, 29.010980); 

  @override
  void initState() {
    super.initState();
    _haritaDenetleyici = MapController();
  }

  // Yakınlastir
  void _yakinlastir() {
    setState(() {
      _mevcutZoom = (_mevcutZoom + 1).clamp(1.0, 18.0); 
      _haritaDenetleyici.move(_baslangicKonumu, _mevcutZoom);
    });
  }

  // Uzaklastir
  void _uzaklastir() {
    setState(() {
      _mevcutZoom = (_mevcutZoom - 1).clamp(1.0, 18.0);
      _haritaDenetleyici.move(_baslangicKonumu, _mevcutZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 199, 243),
        title: const Text('Haritam'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _haritaDenetleyici,
            options: MapOptions(
              initialCenter: _baslangicKonumu, // Başlangıç merkezi
              initialZoom: _mevcutZoom, // Başlangıç zoom seviyesi
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all, // Kullanıcı etkileşimleri aktif
              ),
            ),
            children: [
              // OpenStreetMap Katmanı
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              // Marker Katmanı
              MarkerLayer(
                markers: [
                  Marker(
                    point: _baslangicKonumu,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_pin,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Zoom Butonları
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'yakinlastir',
                  onPressed: _yakinlastir,
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'uzaklastir',
                  onPressed: _uzaklastir,
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
