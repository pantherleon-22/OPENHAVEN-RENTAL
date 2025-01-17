import 'package:flutter/material.dart';

class EmlakEkleScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController secondImageUrlController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController roomsController = TextEditingController();
  final TextEditingController parkingController = TextEditingController();

  EmlakEkleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Ev Ekle'),
        backgroundColor: const Color.fromARGB(255, 174, 199, 243),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: imageUrlController,
                  decoration: InputDecoration(labelText: 'Görsel URL 1'),
                  keyboardType: TextInputType.url,
                  onChanged: (value) {
                    (context as Element).markNeedsBuild();
                  },
                ),
                SizedBox(height: 10),
                imageUrlController.text.isNotEmpty
                    ? Center(
                        child: Image.network(
                          imageUrlController.text,
                          errorBuilder: (context, error, stackTrace) {
                            return Text(
                              'Görsel yüklenemedi. Lütfen geçerli bir URL girin.',
                              style: TextStyle(color: Colors.red),
                            );
                          },
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
                SizedBox(height: 20),
                TextFormField(
                  controller: secondImageUrlController,
                  decoration: InputDecoration(labelText: 'Görsel URL 2'),
                  keyboardType: TextInputType.url,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Fiyat'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Lokasyon'),
                ),
                TextFormField(
                  controller: sizeController,
                  decoration: InputDecoration(labelText: 'Boyut'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: roomsController,
                  decoration: InputDecoration(labelText: 'Oda Sayısı'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: parkingController,
                  decoration: InputDecoration(labelText: 'Park Yeri'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final yeniEmlak = {
                        'images': [
                          imageUrlController.text,
                          secondImageUrlController.text
                        ],
                        'price': priceController.text,
                        'location': locationController.text,
                        'size': sizeController.text,
                        'rooms': roomsController.text,
                        'parking': parkingController.text,
                      };
                      Navigator.pop(context, yeniEmlak);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(174, 199, 243, 1),
                  ),
                  child: Text(
                    'Kaydet',
                    style: TextStyle(
                      color: Colors.black, // Yazı rengi siyah
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
