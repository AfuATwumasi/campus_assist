import 'package:campus_assist/screens/lost_and_found/claimed_screen.dart';
import 'package:flutter/material.dart';

class FoundItemDetailsScreen extends StatelessWidget {
  const FoundItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: Stack(
        children: [
          // Back Button Positioned
          Positioned(
            left: 26,
            top: 39,
            child: Container(
              width: 52,
              height: 55,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.pop(context); // Functional back button
                },
                tooltip: 'Back',
              ),
            ),
          ),

          // Header title
          Positioned(
            left: 0,
            right: 0,
            top: 48,
            child: SizedBox(
              height: 55,
              child: const Text(
                'Found Items',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Content Container
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // Item Image Placeholder
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3E8FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.backpack,
                        size: 70,
                        color: Color(0xFF1F41BB),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Item Name
                    const Text(
                      'Blue Backpack',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Item Description
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'A blue backpack with black zippers and a front pocket, found near the main entrance.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8B899E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),

                    _buildDetailRow(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: 'Library - Floor 2',
                    ),
                    const SizedBox(height: 12),

                    _buildDetailRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Date Found',
                      value: 'June 20, 2025',
                    ),
                    const SizedBox(height: 12),

                    _buildDetailRow(
                      icon: Icons.person_outline,
                      label: 'Found by',
                      value: 'John Doe',
                    ),
                    const SizedBox(height: 30),

                    // Claim Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F41BB),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClaimedItemScreen(),
                            ),
                          );
                        },
                        child: const Text('Claim'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8C8A9E),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black54, size: 18),
              const SizedBox(width: 8),
              Flexible( // ✅ Fixes overflow
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
