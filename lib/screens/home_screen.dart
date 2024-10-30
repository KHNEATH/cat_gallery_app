import 'package:cat_app/providers/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/services/cat_api_service.dart';
import 'package:cat_app/screens/about_us_screen.dart';
import 'package:cat_app/screens/profile_screen.dart';
import 'package:cat_app/screens/search_screen.dart';
import 'DetailScreen.dart';
import 'package:cat_app/widgets/loading_indicator.dart'; // Import the LoadingIndicator

// Language and Theme Management
List<Language> languageList = [
  Language(),
  Khmer(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CatApiService _apiService = CatApiService();
  late Future<List<CatModel>> _catImagesFuture;
  int _selectedIndex = 0;
  bool _isDarkMode = false;
  Language _currentLanguage = Language(); // Default language is English

  @override
  void initState() {
    super.initState();
    _catImagesFuture = _apiService.fetchCatImages(); // Fetch cat images on init
  }

  Future<void> _refreshCatImages() async {
    setState(() {
      _catImagesFuture = _apiService.fetchCatImages(); // Refresh cat images
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _currentLanguage = _currentLanguage is Khmer ? Language() : Khmer();
    });
  }

  void _toggleThemeMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_currentLanguage.appName),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: _toggleLanguage,
              tooltip: _currentLanguage.profile,
            ),
            IconButton(
              icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
              onPressed: _toggleThemeMode,
              tooltip: _isDarkMode
                  ? _currentLanguage.lighMode
                  : _currentLanguage.darkMode,
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            buildCatGallery(),
            SearchScreen(),
            AboutUsScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: _currentLanguage.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: _currentLanguage.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: _currentLanguage.information,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: _currentLanguage.profile,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget buildCatGallery() {
    return FutureBuilder<List<CatModel>>(
      future: _catImagesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Use the custom LoadingIndicator instead of CircularProgressIndicator
          return const LoadingIndicator(message: 'Loading cat images...');
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load cat images: ${snapshot.error}'));
        } else if (snapshot.data?.isNotEmpty ?? false) {
          final catImages = snapshot.data!;
          return RefreshIndicator(
            onRefresh: _refreshCatImages,
            child: ListView.builder(
              itemCount: catImages.length,
              itemBuilder: (context, index) {
                final cat = catImages[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(cat: cat),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.network(
                              cat.url,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : const LoadingIndicator(message: 'Loading image...');
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/placeholder.png');
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cat.breeds.isNotEmpty ? cat.breeds[0].name : 'Unknown Breed',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('No cat images available'));
        }
      },
    );
  }
}
