import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Modified Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    onPressed: () {
                      Navigator.pop(context); // Standard back action
                    },
                    tooltip: 'Back',
                  ),
                  // Title
                  const Text(
                    'Chats',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Search Button
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black, size: 28),
                    onPressed: () {
                      // TODO: Implement search functionality
                      print('Search button tapped');
                      // You might show a search bar, navigate to a search screen, etc.
                    },
                    tooltip: 'Search',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  chatItem('Liam Carter', 'Sure, see you then', '3:45 PM'),
                  chatItem('Sophia Turner', 'Thanks for helping me find it!', 'Yesterday'),
                  chatItem('Ethan Bennett', "I'll be there in 10 minutes", '2 days ago'),
                  chatItem('Olivia Hayes', 'No problem, glad I could assist', '3 days ago'),
                  chatItem('Noah Parker', "I've already contacted the authorities", '4 days ago'),
                  chatItem('Ava Mitchell', "I'll keep an eye out for it", '5 days ago'),
                  chatItem('Jackson Reed', "I'm so grateful for your help", '6 days ago'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Removed the bottomNavigationBar from here as it seems it was from a previous version
      // or should be handled by a parent widget managing overall app navigation.
    );
  }

  Widget chatItem(String name, String message, String time) {
    // ... your chatItem widget code remains the same
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFF1F41BB),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF111116),
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF636D87),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xFF636D87),
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

