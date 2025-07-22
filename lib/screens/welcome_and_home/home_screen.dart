import 'package:flutter/material.dart';

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
                  // Home Page title
                  const Text(
                    'Home Page',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
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
                      
                      // Good morning section
                      Row(
                        children: [
                          // Avatar image before good morning
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/gg_profile.png', 
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good morning',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Jessica',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  
                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Search campus safety tools',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Main content area
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Action buttons grid
                    Row(
                      children: [
                        // Report Incident button
                        // Expanded(
                        //   child: Container(
                        //     height: 120,
                        //     padding: const EdgeInsets.all(15),
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xFF4A90E2),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         // Warning icon
                        //         Image.asset(
                        //           'assets/images/report.png',
                        //           width: 24,
                        //           height: 24,
                        //           color: Colors.white,
                        //         ),
                        //         const Spacer(),
                        //         const Text(
                        //           'Report\nIncident',
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),


// ... your other imports

// In your widget build method:

                Expanded(
                child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement your button's tap functionality here
                  Navigator.pushNamed(context, '/new_report');
                  print('Report Incident button tapped!');
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A90E2), // Button background color
                padding: EdgeInsets.zero, // Remove default padding to use Container's padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Match your Container's border radius
                ),
                elevation: 0, // Optionally remove default elevation if you have custom shadows
              ),
              child: Container(
                height: 120,
                // The padding is now controlled by the ElevatedButton or you can keep it here
                // if you prefer, but ensure there's no double padding.
                // For this example, I'll keep it in the Container and set button padding to zero.
                padding: const EdgeInsets.all(15),
                // The decoration (color, borderRadius) is now primarily handled by ElevatedButton's style.
                // You can remove the decoration from the Container if the ElevatedButton style is sufficient.
                // decoration: BoxDecoration(
                //   color: const Color(0xFF4A90E2), // This is now in ElevatedButton's style
                //   borderRadius: BorderRadius.circular(15), // This is now in ElevatedButton's style
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Warning icon
                    Image.asset(
                      'assets/images/report.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    const Text(
                      'Report\nIncident',
                      style: TextStyle(
                        color: Colors.white,
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

                        // Campus Alert button
                        Expanded(
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF9E9E9E),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Alert icon
                                Image.asset(
                                  'assets/images/alert.png',
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ),
                                const Spacer(),
                                const Text(
                                  'Campus\nAlert',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    Row(
                      children: [
                        // Feedback button
                        Expanded(
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A90E2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Feedback icon
                                Image.asset(
                                  'assets/images/feedback_image.png',
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ),
                                const Spacer(),
                                const Text(
                                  'Feedback',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Lost and Found button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/lost_found');
                              // TODO: Implement Lost and Found button tap functionality
                              print('Lost and Found button tapped!');

                              // Example: Navigator.pushNamed(context, '/lost_and_found');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7986CB), // Button background color
                              padding: EdgeInsets.zero, // Remove default padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Match Container's border radius
                              ),
                              elevation: 0, // Optional: remove default elevation
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(15),
                              // decoration is now handled by ElevatedButton's style
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end, // This remains as per your original code
                                children: [
                                  Text(
                                    'Lost and\nfound',
                                    style: TextStyle(
                                      color: Colors.white,
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

                    // Recent Activities section
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Activities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Activity items
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
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                '2 hours ago',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
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
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                '4 hours ago',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            
            // Bottom navigation bar
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
                  // Home icon 
                  Image.asset(
                    'assets/images/home_icon.png', 
                    width: 24,
                    height: 24,
                  ),
                  // Messages icon 
                  Image.asset(
                    'assets/images/messages_icon.png', 
                    width: 24,
                    height: 24,
                  ),
                  // Document icon
                  Image.asset(
                    'assets/images/clipboard_image.png', 
                    width: 24,
                    height: 24,
                  ),
                  // Settings icon 
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
}