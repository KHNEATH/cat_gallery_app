import 'package:flutter/material.dart';
import 'package:cat_app/models/cat_model.dart';

class DetailScreen extends StatelessWidget {
  final CatModel cat;

  // Constructor to accept a CatModel instance
  const DetailScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.breeds.isNotEmpty ? cat.breeds[0].name : 'Cat Details'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cat image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  cat.url,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Cat name and breed
            Text(
              '${cat.breeds.isNotEmpty ? cat.breeds[0].name : 'Unknown Breed'}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // Cat age
            if (cat.breeds.isNotEmpty)
              Text(
                'Origin: ${cat.breeds[0].origin}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 16),
            // Description
            Text(
              'Description',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              cat.breeds.isNotEmpty ? cat.breeds[0].description : 'No description available.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            // Additional information
            if (cat.breeds.isNotEmpty)
              Text(
                'Temperament: ${cat.breeds[0].temperament}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 24),
            // Contact or adoption section (if applicable)
            ElevatedButton(
              onPressed: () {
                // Add action for adopting or contacting
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Interested in adopting ${cat.breeds.isNotEmpty ? cat.breeds[0].name : 'this cat'}')),
                );
              },
              child: Text('Adopt ${cat.breeds.isNotEmpty ? cat.breeds[0].name : 'this cat'}'),
            ),
          ],
        ),
      ),
    );
  }
}
