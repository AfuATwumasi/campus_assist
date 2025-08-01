import 'package:flutter/material.dart';

class ReportSubmittedScreen extends StatelessWidget {
  const ReportSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: Center(
        child: Stack(
          children: [
            // White rounded card starting at top: 185
            Positioned(
              top: 185,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 741,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Report Submitted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F41BB),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Thank you for your report. You can track the status in ‘My Reports’.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // 🟩 Go to Dashboard button (now enabled)
                    SizedBox(
                      width: 183,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate back to the HomeScreen
                          // Option 1: If HomeScreen is the very first screen (root) and you want to clear the stack
                          Navigator.pushNamed(context, '/home');

                          // Option 2: If you want to push a new instance of HomeScreen (less common for "go to dashboard" from a submitted screen)
                          // Make sure to import your HomeScreen, e.g.:
                          // import 'package:your_app_name/screens/home_screen.dart'; // Adjust path as needed
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const HomeScreen()), // Replace HomeScreen with your actual home screen widget
                          //   (Route<dynamic> route) => false, // This removes all previous routes
                          // );

                          // Option 3: If you have a specific named route for your home screen
                          // Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFFBFBFB),
                          side: const BorderSide(
                            color: Color(0xFF1F41BB),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Go to Dashboard',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // For OutlinedButton, you might want this to be Theme-dependent or match the border
                            // e.g., color: Color(0xFF1F41BB) if you want blue text
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),


                    // 🟦 View My Reports button
                    SizedBox(
                      width: 183,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_reports');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F41BB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'View My Reports',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
