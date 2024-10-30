import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
// Default language

  final List<Widget> _screens = [
    // Add your screen widgets here
    // ApiReadingScreen(),
    // SearchScreen(),
    // AboutUsScreen(),
  ];

  void _changeLanguage(String languageCode) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat API App'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _changeLanguage,
            itemBuilder: (BuildContext context) {
              return {'en', 'km'}.map((String languageCode) {
                return PopupMenuItem<String>(
                  value: languageCode,
                  child: Text(languageCode == 'en' ? 'English' : 'Khmer'),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.api), label: 'API'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About Us'),
        ],
      ),
    );
  }
}