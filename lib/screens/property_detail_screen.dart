// lib/screens/property_detail_screen.dart
import 'package:flutter/material.dart';
import '../widgets/drawer.dart'; // 📌 Drawer'ı import ettik

class EmlakDetayScreen extends StatefulWidget {
  const EmlakDetayScreen({super.key});

  @override
  _EmlakDetayScreenState createState() => _EmlakDetayScreenState();
}

class _EmlakDetayScreenState extends State<EmlakDetayScreen> {
  late Map<String, dynamic> emlak;
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    emlak = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage(List<String> images) {
    if (_currentIndex < images.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = emlak['images'].cast<String>();

    return Scaffold(
      appBar: AppBar(
        title: Text('OPENHAVEN KİRALAMA'),
        backgroundColor: const Color.fromARGB(255, 174, 199, 243),
        centerTitle: true,
      ),
      drawer: UygulamaCekmecesi(), // 📌 Drawer'ı ekledik
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color.fromARGB(255, 174, 199, 243),
                      child:
                          Icon(Icons.image, size: 50, color: Colors.grey[600]),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Sayfa göstergesi noktalar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 10 : 8,
                height: _currentIndex == index ? 10 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color.fromARGB(255, 174, 199, 243)
                      : const Color.fromARGB(255, 174, 199, 243).withOpacity(0.5),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '₺${emlak['price']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(emlak['location'], style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text('Boyut: ${emlak['size']}'),
                Text('Oda: ${emlak['rooms']}'),
                Text('Park Yeri: ${emlak['parking']}'),
              ],
            ),
          ),
          // Alt tarafta önceki ve sonraki butonları
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _previousPage,
                child: Text('Önceki Resim'),
              ),
              TextButton(
                onPressed: () => _nextPage(images),
                child: Text('Sonraki Resim'),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
