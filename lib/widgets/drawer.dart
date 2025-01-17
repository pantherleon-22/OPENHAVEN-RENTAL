import 'package:flutter/material.dart';

class UygulamaCekmecesi extends StatelessWidget {
  const UygulamaCekmecesi({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Drawer'ın üst kısmındaki başlık
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 174, 199, 243),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'logo.png',
                width: 600,
                height: 600,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Drawer Menüsü Öğeleri
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Ev Ekle'),
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Musteri Kayit'),
            onTap: () {
              Navigator.pushNamed(context, '/kisisel_bilgiler');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Harita'),
            onTap: () {
              Navigator.pushNamed(context, '/harita');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cikis'),
            onTap: () {
              Navigator.of(context).pop(); // Drawer'ı kapatır
            },
          ),
        ],
      ),
    );
  }
}
