import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/screens/about_us_screen.dart';
import 'package:cat_app/screens/home_screen.dart';
import 'package:cat_app/screens/profile_screen.dart';
import 'package:cat_app/services/cat_api_service.dart';
import 'package:cat_app/models/cat_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CatModel> _catImages = [];
  bool _isLoading = false;
  String? _errorMessage;

  void _searchCats() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
   

    try {
      final catApiService = CatApiService();
      // Modify this to use a search endpoint if available
      String searchQuery = _searchController.text.trim();
      
      // If your API supports searching, use that endpoint
      _catImages = await catApiService.searchCatImages(searchQuery); // Implement this in your service
      
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load cat images: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  int _selectedIndex = 1; // Set the selected index to Search

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Cats'),
        backgroundColor: Color(0xFFFFB26F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for cats',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchCats,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            _isLoading
                ? CircularProgressIndicator()
                : _errorMessage != null
                    ? Text(_errorMessage!, style: TextStyle(color: Colors.red))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _catImages.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Image.network(_catImages[index].url),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Cat ID: ${_catImages[index].id}'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
      
    );
  }
}