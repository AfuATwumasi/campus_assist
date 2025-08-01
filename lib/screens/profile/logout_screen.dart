import 'package:flutter/material.dart';

class LogoutConfirmationScreen extends StatelessWidget {
  const LogoutConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 19,
              top: 417,
              child: SizedBox( // Changed Container to SizedBox as it's only for sizing here
                width: 390,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( // This container seems purely for layout/spacing
                      width: double.infinity,
                      height: 72,
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 8,
                      ),
                      decoration: const BoxDecoration(color: Colors.white), // Assuming this is intentional
                    ),
                    Container( // This container holds the confirmation text
                      width: double.infinity,
                      // height: 60, // Height can be determined by child
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                        bottom: 12,
                      ),
                      child: const Column( // Added const
                        children: [
                          SizedBox( // Added const
                            width: 358,
                            child: Text(
                              'Are you sure you want to log out?',
                              textAlign: TextAlign.center,
                              style: TextStyle( // Added const
                                color: Color(0xFF111116),
                                fontSize: 22,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                height: 1.27,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Logout Button
                            // For this button to be functional, it would also need a GestureDetector/InkWell
                            Container(
                              height: 48,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF1442C6), // Added const
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Logout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle( // Added const
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Cancel Button - MODIFIED PART
                            GestureDetector( // Wrap the original Container with GestureDetector
                              onTap: () {
                                Navigator.pop(context); // Action to go back to the previous screen
                              },
                              child: Container( // This is your original Cancel button Container
                                height: 48,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFEFF2F4), // Added const
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Cancel',
                                    textAlign: TextAlign.center,
                                    style: TextStyle( // Added const
                                      color: Color(0xFF111116),
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

