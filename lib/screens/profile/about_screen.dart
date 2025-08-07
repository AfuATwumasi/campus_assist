import 'package:flutter/material.dart';

class CampusAssistScreen extends StatelessWidget {
  const CampusAssistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F41BB),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'About Campus Assist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            Image.asset(
              'assets/images/about.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 24),

            const Text(
              'Our Mission',
              style: TextStyle(
                color: Color(0xFF111116),
                fontSize: 22,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 1.27,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'CampusAssist is dedicated to connecting students and staff with lost items on campus. We aim to reduce the stress of losing belongings and streamline the process of finding them.',
              style: TextStyle(
                color: Color(0xFF111116),
                fontSize: 16,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Key Features',
              style: TextStyle(
                color: Color(0xFF111116),
                fontSize: 22,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 1.27,
              ),
            ),
            const SizedBox(height: 16),
            featureCard(
              title: 'Lost and Found',
              description: 'Report lost items and search for found items on campus.',
              imagePath: 'assets/images/search.png',
            ),
            featureCard(
              title: 'Report Incident',
              description: 'Report incidents such as theft or damage on campus.',
              imagePath: 'assets/images/shield.png',
            ),
            featureCard(
              title: 'Campus Alerts',
              description: 'Receive real-time alerts about campus events and emergencies.',
              imagePath: 'assets/images/alarm.png',
            ),
            featureCard(
              title: 'Feedback Systems',
              description: 'Provide feedback on campus services and report issues.',
              imagePath: 'assets/images/sound.png',
            ),

            const SizedBox(height: 32),
            const Text(
              'Our Team',
              style: TextStyle(
                color: Color(0xFF111116),
                fontSize: 22,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 1.27,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'CampusAssist was developed by a team of students and faculty passionate about improving campus life. We believe in the power of community and technology to solve everyday challenges.',
              style: TextStyle(
                color: Color(0xFF111116),
                fontSize: 16,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget featureCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF2F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF111116),
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF636B87),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
