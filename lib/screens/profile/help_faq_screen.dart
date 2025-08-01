import 'package:flutter/material.dart';

class HelpFaqsScreen extends StatelessWidget {
  const HelpFaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header with back button and title
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 80), // Adjusted padding for better balance
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1F41BB),
              borderRadius: BorderRadius.only( // MODIFIED: Changed to top corners
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                // bottomLeft and bottomRight are now straight by default
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 28), // Made icon slightly larger
                ),
                const SizedBox(width: 16),
                Expanded( // Added Expanded to help center the title
                  child: Text(
                    'Helps and FAQs',
                    textAlign: TextAlign.center, // Center the text within the Expanded space
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Add a SizedBox to balance the back arrow for true centering, matching icon + its SizedBox width
                const SizedBox(width: 28 + 16),
              ],
            ),
          ),

          // Question mark icon
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFD9E2FF),
            child: Icon(Icons.help_outline, size: 40, color: Color(0xFF1F41BB)),
          ),

          // Title & Subtitle
          const SizedBox(height: 16),
          const Text(
            'Help & FAQs',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Find answers to common questions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),

          const SizedBox(height: 24),

          // FAQs List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: const [
                FAQTile(title: 'How does the lost and found feature work?'),
                FAQTile(title: 'How do I report a found item?'),
                FAQTile(title: 'How do I contact someone who found my item?'),
                FAQTile(title: 'How long are posts active?'),
                FAQTile(title: 'How to update profile information'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String title;

  const FAQTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFD7D8DC)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.expand_more, color: Colors.black54),
        onTap: () {
          // Add FAQ detail logic here
        },
      ),
    );
  }
}
