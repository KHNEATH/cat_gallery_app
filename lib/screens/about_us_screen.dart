import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFFFFB26F),
      ),
      body: Padding(
        padding: const EdgeInsets.all (16.0),
        child: Column(
          children: [
            // Display the image at the top
            SizedBox(height: 16),
            Text(
              'Welcome to Cat Gallery App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'A place where cat lovers can spend countless hours scrolling through endless cat images. Cat Gallery is an app design for cat lovers. It showcases stunning cat photos and lets users explore different breeds. With a powerful search function, users can easily find specific cats or breeds they are interested in. Once they find a breed you like, they can also dive deeper into details.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 100),
            Text(
              'Developed by "Cat Gallery App Production"',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    
    );
  }
}