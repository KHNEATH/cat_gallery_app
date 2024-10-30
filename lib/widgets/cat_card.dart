// cat_card.dart

import 'package:flutter/material.dart';// Updated the import to lowercase

class Cat {
  final String name;
  final String breed;
  final int age;
  final String imageUrl;

  Cat({
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
  });
}

class CatCard extends StatelessWidget {
  final Cat cat; // Updated the type to the custom Cat model
  final VoidCallback onTap;

  const CatCard({
    Key? key,
    required this.cat,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          cat.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Image.asset('assets/images/placeholder.png'); // Placeholder image path
          },
        ),
        title: Text(
          cat.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${cat.breed}, ${cat.age} years old'),
        onTap: onTap,
      ),
    );
  }
}
