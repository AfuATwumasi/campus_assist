import 'package:campus_assist/screens/profile/profile_info_screen.dart';
import 'package:flutter/material.dart';

// 1. IMPORT YOUR PROFILE SCREEN FILE HERE
// Example: import 'profile_screen.dart';
// Make sure the path is correct based on your project structure.
// If you haven't created it yet, this line will show an error.
// For now, I'll comment it out. Replace with your actual import.
// import 'profile_screen.dart';

class CampusSafetyHomePage extends StatelessWidget {
  const CampusSafetyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  // Profile section
                  Row(
                    children: [
                      // Logo image
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),

                      // Welcome section
                      Row(
                        children: [
                          // --- MODIFIED PROFILE IMAGE BUTTON ---
                          GestureDetector( // Added GestureDetector
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ProfileInfoScreen()),
                              );

                              print("Profile image tapped! Navigate to ProfileScreen."); // For debugging
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 1,
                                ),
                                // Optional: Add a subtle shadow for better affordance
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/gg_profile.png', // Ensure this path is correct
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // --- END OF MODIFIED PROFILE IMAGE BUTTON ---
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),

            // Main content area
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/new_report');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A90E2),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/report.png',
                                      width: 24,
                                      height: 24,
                                      color: const Color(0xFF1F41BB)),
                                  const Spacer(),
                                  const Text(
                                    'Report\nIncident',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/campus_alert_page');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9E9E9E),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/alert.png',
                                      width: 24, height: 24, color: Colors.black),
                                  const Spacer(),
                                  const Text(
                                    'Campus\nAlert',
                                    style: TextStyle(
                                      color: Color(0xFF121217),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/feedback');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F41BB),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/images/feedback_image.png',
                                      width: 24,
                                      height: 24,
                                      color: Colors.black),
                                  const Spacer(),
                                  const Text(
                                    'Feedback',
                                    style: TextStyle(
                                      // Changed text color to white for better contrast
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/lost_found');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8298DF), // Mid-tone blue
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(15),
                              child: Column( // Column to stack Image and Text
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // --- IMAGE ADDED HERE ---
                                  Image.asset(
                                    'assets/images/lost.png', // Replace with your actual image path
                                    width: 24, // Adjust size as needed
                                    height: 24, // Adjust size as needed
                                    //color: Colors.white, // Make icon white for contrast
                                  ),
                                  const Spacer(), // Pushes the text to the bottom
                                  const Text(
                                    'Lost and\nfound',
                                    style: TextStyle(
                                      color: Colors.black, // Changed to white for better contrast
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Activities',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'An alert has been issued regarding weather conditions. Stay safe!',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ),
                              Text(
                                '2 hours ago',
                                style:
                                TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(color: Colors.grey, height: 1),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Lost item reported near the library. Check the lost and found section',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ),
                              Text(
                                '4 hours ago',
                                style:
                                TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(), // Pushes recent activities up if list is short
                  ],
                ),
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
                  Expanded(
                    child: IconButton(
                      icon: Image.asset('assets/images/home_icon.png',
                          width: 24, height: 24),
                      onPressed: () {
                        // Avoid pushing if already on home, or use pushReplacementNamed
                        if (ModalRoute.of(context)?.settings.name != '/home') {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      tooltip: 'Home',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Image.asset(
                          'assets/images/material-symbols-light_add-box-outline.png',
                          width: 24,
                          height: 24),
                      onPressed: () {
                        Navigator.pushNamed(context, '/new_report');
                      },
                      tooltip: 'Report',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Image.asset('assets/images/messages_icon.png',
                          width: 24, height: 24),
                      onPressed: () {
                        Navigator.pushNamed(context, '/messages');
                      },
                      tooltip: 'Messages',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Image.asset('assets/images/settings_icon.png',
                          width: 24, height: 24),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      tooltip: 'Settings',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. DEFINE YOUR PROFILE SCREEN WIDGET (Ideally in a separate file like profile_screen.dart)
// For demonstration, I'm putting a placeholder here.
// You should create a proper 'profile_screen.dart' and import it above.

/*
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF1F41BB), // Example color
      ),
      body: const Center(
        child: Text(
          'Profile Details Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
*/
