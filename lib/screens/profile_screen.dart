import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color(0xFFFFB26F),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Icon
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300], // Background color for the icon
                child: const Icon(
                  Icons.person, // Use the person icon
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // User Name
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // User Email
            const Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Implement edit profile functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile feature coming soon!')),
                );
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 16),
            // Log Out Button
            ElevatedButton(
              onPressed: () {
                // Implement log out functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging out...')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Change button color
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
