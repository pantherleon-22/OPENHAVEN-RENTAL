import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_page.dart'; // Login ekranını import ediyoruz
import 'screens/property_list_screen.dart';
import 'screens/property_detail_screen.dart';
import 'screens/add_property_screen.dart';
import 'screens/personal_info.dart';
import 'screens/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDHip1kK4YcV_7yNTyHjIe7iLwvwaQLXFg",
        authDomain: "meze-d8a9c.firebaseapp.com",
        databaseURL: "https://meze-d8a9c-default-rtdb.firebaseio.com",
        projectId: "meze-d8a9c",
        storageBucket: "meze-d8a9c.appspot.com",
        messagingSenderId: "1000497688622",
        appId: "1:1000497688622:web:57d244e8ae4dd2ddf36fbf",
        measurementId: "G-7JKW74N77K",
      ),
    );
    runApp(HermesKiralamaUygulamasi());
  } catch (e) {
    print('Firebase başlatılamadı: $e');
  }
}

class HermesKiralamaUygulamasi extends StatefulWidget {
  @override
  _HermesKiralamaUygulamasiState createState() => _HermesKiralamaUygulamasiState();
}

class _HermesKiralamaUygulamasiState extends State<HermesKiralamaUygulamasi> {
  // Ev listesi
  final List<Map<String, dynamic>> allProperties = [
    {
      'images': [
        'https://photos.zillowstatic.com/fp/f3f1f33e57fee9e0df8c20ece86901b6-cc_ft_960.webp',
        'https://res.cloudinary.com/onmap-prod/image/upload/if_iw_gt_1508,w_1508,c_fill/if_else,h_900,c_fill/q_auto,f_auto/j6os8qjcrynuxdniotjb'
      ],
      'price': '11,000',
      'location': 'Avraham Boyer St. 5, Ramat Aviv Gimel',
      'size': '126 m²',
      'rooms': '5+1',
      'parking': '1'
    },
    {
      'images': [
        'https://photos.zillowstatic.com/fp/b5ec9e8aca91d62ce27e806ac9fc59c7-uncropped_scaled_within_1536_1152.webp',
        'https://res.cloudinary.com/onmap-prod/image/upload/if_iw_gt_1508,w_1508,c_fill/if_else,h_900,c_fill/q_auto,f_auto/g4p1qmqm5svtcmogvglu'
      ],
      'price': '6,400',
      'location': 'HaKongres St. 6, Neve Sha\'anan',
      'size': '52 m²',
      'rooms': '2+1',
      'parking': '0'
    },
    {
      'images': [
        'https://photos.zillowstatic.com/fp/a3b718e08f7ce2868bda898f20919d28-cc_ft_960.webp',
        'https://res.cloudinary.com/onmap-prod/image/upload/if_iw_gt_1508,w_1508,c_fill/if_else,h_900,c_fill/q_auto,f_auto/mqie28qxziczhafgog7e'
      ],
      'price': '7,500',
      'location': 'Derech HaShalom 10, Tel Aviv',
      'size': '95 m²',
      'rooms': '3+1',
      'parking': '1'
    },
  ];

  // Yeni bir property eklemek için kullanılacak yöntem
  void addProperty(Map<String, dynamic> newProperty) {
    setState(() {
      allProperties.add(newProperty); // Yeni property'yi listeye ekliyoruz
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPENHAVEN RENTAL',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => EmlakListeSayfasi(
              tumEmlaklar: allProperties,
              emlakEkle: addProperty,
            ),
        '/login': (BuildContext context) => GirisSayfasi(),
        '/detail': (BuildContext context) => EmlakDetayScreen(),
        '/add': (BuildContext context) => EmlakEkleScreen(),
        '/kisisel_bilgiler': (BuildContext context) => KisiselBilgilerEkrani(),
        '/harita': (BuildContext context) => const  NavigasyonSayfasi(),
      },
    );
  }
}
