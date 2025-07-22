// import 'package:campus_assist/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';// Import your homepage
import 'package:campus_assist/screens/welcome_and_home/home_screen.dart'
    show CampusSafetyHomePage;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  ClipOval(
                    child: Image.asset(
                      'assets/images/gg_profile.png',
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            // Settings Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  buildSettingItem(Icons.person, 'Account'),
                  buildSettingItem(Icons.notifications, 'Notifications'),
                  buildSettingItem(Icons.lock, 'Privacy'),
                  buildSettingItem(Icons.help, 'Help & Support'),
                  buildSettingItem(Icons.info, 'About'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Link to Home Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusSafetyHomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusSafetyHomePage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/home_icon.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Image.asset(
                    'assets/images/messages_icon.png',
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/clipboard_image.png',
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/settings_icon.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable settings item widget
  Widget buildSettingItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: Icon(icon, color: Colors.grey[700]),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Add action for each setting item
          },
        ),
        const Divider(),
      ],
    );
  }
}
