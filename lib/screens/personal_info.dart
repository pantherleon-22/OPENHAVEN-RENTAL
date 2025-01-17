import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class KisiselBilgilerEkrani extends StatefulWidget {
  @override
  _KisiselBilgilerEkraniState createState() => _KisiselBilgilerEkraniState();
}

class _KisiselBilgilerEkraniState extends State<KisiselBilgilerEkrani> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();

  final CollectionReference _kisiselBilgiler =
      FirebaseFirestore.instance.collection('kisisel_bilgiler');

  String _seciliBelgeId = ''; // Güncelleme için belge ID'sini tutar

  // Yeni bilgi ekleme
  void _bilgiEkle() {
    if (_adController.text.isNotEmpty && _telefonController.text.isNotEmpty) {
      int telefon = int.tryParse(_telefonController.text) ?? 0;
      if (telefon > 0) {
        _kisiselBilgiler.add({
          'ad': _adController.text,
          'telefon': telefon,
          'eklenme_tarihi': Timestamp.now(),
        }).then((_) {
          // Başarılı ekleme sonrası alanları temizle
          _adController.clear();
          _telefonController.clear();
          _seciliBelgeId = '';
        }).catchError((error) {
          _hataMesajiGoster("Ekleme başarısız: $error");
        });
      } else {
        _hataMesajiGoster("Telefon numarası geçersiz!");
      }
    }
  }

  // Bilgi güncelleme
  void _bilgiGuncelle() {
    if (_adController.text.isNotEmpty && _telefonController.text.isNotEmpty) {
      int telefon = int.tryParse(_telefonController.text) ?? 0;
      if (telefon > 0) {
        _kisiselBilgiler.doc(_seciliBelgeId).update({
          'ad': _adController.text,
          'telefon': telefon,
        }).then((_) {
          // Başarılı güncelleme sonrası alanları temizle
          _adController.clear();
          _telefonController.clear();
          _seciliBelgeId = '';
        }).catchError((error) {
          _hataMesajiGoster("Güncelleme başarısız: $error");
        });
      } else {
        _hataMesajiGoster("Telefon numarası geçersiz!");
      }
    }
  }

  // Bilgi silme
  void _bilgiSil(String belgeId) {
    _kisiselBilgiler.doc(belgeId).delete().then((_) {
      _hataMesajiGoster("Bilgi silindi.");
    }).catchError((error) {
      _hataMesajiGoster("Silme başarısız: $error");
    });
  }

  // Hata mesajı gösterme
  void _hataMesajiGoster(String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesaj)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişisel Bilgiler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _adController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _telefonController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Telefon'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _bilgiEkle,
              child: Text('Ekle'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _kisiselBilgiler.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Hata: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(document['ad']),
                        subtitle: Text(document['telefon'].toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _adController.text = document['ad'];
                                  _telefonController.text =
                                      document['telefon'].toString();
                                  _seciliBelgeId = document.id;
                                });
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _bilgiSil(document.id);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _seciliBelgeId.isEmpty ? null : _bilgiGuncelle,
              child: Text('Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
