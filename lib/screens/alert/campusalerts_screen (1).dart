import 'package:flutter/material.dart';

class CampusAlertsScreen extends StatelessWidget {
  const CampusAlertsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Campus Alerts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Class Cancellations Alert 1
            AlertCard(
              icon: Icons.warning,
              iconColor: const Color(0xFF007AFF),
              title: 'Class Cancellations',
              description: 'All classes have been cancelled for the week due to the SRC week celebration.',
              timeAgo: '2 hours ago',
            ),
            const SizedBox(height: 12),
            
            // Transport Alerts
            AlertCard(
              icon: Icons.warning,
              iconColor: const Color(0xFF007AFF),
              title: 'Transport Alerts',
              description: 'Shuttles will not be moving from Brunei to KSB due to the graduation ceremony happening at Great Hall.',
              timeAgo: '6 hours ago',
            ),
            const SizedBox(height: 12),
            
            // Class Cancellations Alert 2
            AlertCard(
              icon: Icons.warning,
              iconColor: const Color(0xFF007AFF),
              title: 'Class Cancellations',
              description: 'All classes have been cancelled for the day because of the Vice Chancellor Award Cermony happening at 10am.',
              timeAgo: '8 hours ago',
            ),
            const SizedBox(height: 12),
            
            // Internship Alert
            AlertCard(
              icon: Icons.school,
              iconColor: const Color(0xFF007AFF),
              title: 'Internship',
              description: 'Internship fair happening this Friday. Bring your CV!',
              timeAgo: '2 hours ago',
            ),
          ],
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String timeAgo;

  const AlertCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD0D0FF),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  timeAgo,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
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