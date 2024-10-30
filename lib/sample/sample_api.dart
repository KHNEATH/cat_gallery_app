import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatImageGrid(),
    );
  }
}

class CatImageGrid extends StatefulWidget {
  @override
  _CatImageGridState createState() => _CatImageGridState();
}

class _CatImageGridState extends State<CatImageGrid> {
  List<String> catImages = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchCatImages();
  }

  Future<void> fetchCatImages() async {
    try {
      final url = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          catImages = data.map((item) => item['url'] as String).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load cat images: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Images'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemCount: catImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        catImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
    );
  }
}