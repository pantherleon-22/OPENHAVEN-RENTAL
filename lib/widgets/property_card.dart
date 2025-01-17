// lib/widgets/property_card.dart
import 'package:flutter/material.dart';

class EmlakKarti extends StatelessWidget {
  final List<String> gorseller;
  final String fiyat;
  final String konum;
  final String boyut;
  final String odalar;
  final String otopark;

  const EmlakKarti({
    super.key,
    required this.gorseller,
    required this.fiyat,
    required this.konum,
    required this.boyut,
    required this.odalar,
    required this.otopark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              gorseller[0],
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // 📌 Hata yönetimi ekledik
                return Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₺$fiyat',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  konum,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Boyut: $boyut'),
                    Text('Oda: $odalar'),
                    Text('Park: $otopark'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
