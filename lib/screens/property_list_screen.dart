// lib/screens/property_list_screen.dart
import 'package:flutter/material.dart';
import '../widgets/property_card.dart';
import '../widgets/drawer.dart'; // 📌 Drawer'i import ettik

class EmlakListeSayfasi extends StatefulWidget {
  final List<Map<String, dynamic>> tumEmlaklar;
  final Function(Map<String, dynamic>) emlakEkle;

  const EmlakListeSayfasi(
      {super.key, required this.tumEmlaklar, required this.emlakEkle});

  @override
  _EmlakListeSayfasiState createState() => _EmlakListeSayfasiState();
}

class _EmlakListeSayfasiState extends State<EmlakListeSayfasi> {
  List<Map<String, dynamic>> filtrelenmisEmlaklar = [];

  @override
  void initState() {
    super.initState();
    filtrelenmisEmlaklar = widget.tumEmlaklar;
  }

  @override
  void didUpdateWidget(covariant EmlakListeSayfasi eskiWidget) {
    super.didUpdateWidget(eskiWidget);
    filtrelenmisEmlaklar = widget.tumEmlaklar;
  }

  void _emlakFiltrele(String arama) {
    if (arama.isEmpty) {
      setState(() {
        filtrelenmisEmlaklar = widget.tumEmlaklar;
      });
      return;
    }

    setState(() {
      filtrelenmisEmlaklar = widget.tumEmlaklar.where((emlak) {
        final lokasyon = emlak['location'].toLowerCase();
        final fiyat = emlak['price'].toLowerCase();
        final aramaSorgusu = arama.toLowerCase();
        return lokasyon.contains(aramaSorgusu) || fiyat.contains(aramaSorgusu);
      }).toList();
    });
  }

  void _emlakEkleSayfasinaGit() async {
    final yeniEmlak = await Navigator.pushNamed(context, '/add');
    if (yeniEmlak != null && yeniEmlak is Map<String, dynamic>) {
      widget.emlakEkle(yeniEmlak); // 📌 emlakEkle metodunu cagirdik
      setState(() {
        filtrelenmisEmlaklar = widget.tumEmlaklar;
      });
    }
  }

  void _detaySayfasinaGit(Map<String, dynamic> emlak) {
    Navigator.pushNamed(context, '/detail', arguments: emlak);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPENHAVEN KİRALAMA'),
        backgroundColor: const Color.fromARGB(255, 174, 199, 243),
        centerTitle: true,
        elevation: 10,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      drawer: UygulamaCekmecesi(), // 📌 Drawer'i ekledik
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ara (Orn: Lokasyon, Fiyat)...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => _emlakFiltrele(value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtrelenmisEmlaklar.length,
              itemBuilder: (context, index) {
                final emlak = filtrelenmisEmlaklar[index];
                return GestureDetector(
                  onTap: () => _detaySayfasinaGit(emlak),
                  child: EmlakKarti(
                    gorseller: emlak['images'].cast<String>(),
                    fiyat: emlak['price'],
                    konum: emlak['location'],
                    boyut: emlak['size'],
                    odalar: emlak['rooms'],
                    otopark: emlak['parking'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _emlakEkleSayfasinaGit,
        backgroundColor: const Color.fromARGB(255, 174, 199, 243),
        child: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
