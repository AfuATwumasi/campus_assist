import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key}); // Use super.key for modern Flutter

  @override
  Widget build(BuildContext context) {
    // For responsiveness, consider using MediaQuery to get screen dimensions
    // instead of fixed width/height for the main container, or make the container
    // more flexible (e.g. by using less fixed positioning for internal elements).
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          // Consider making width and height responsive or letting content define it
          width: 428, // Max width for a large phone, could be an issue on smaller devices or tablets
          height: 926, // Similar to width, fixed height might lead to overflow/underflow
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), // Large radius, ensure it looks as intended
            ),
            // Optional: Add a subtle shadow if this is meant to look like a modal dialog
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     blurRadius: 10,
            //     spreadRadius: 2,
            //   )
            // ],
          ),
          child: Stack(
            // Using Stack with Positioned for all elements can make layouts rigid.
            // Consider Column for the main axis of elements and use Stack sparingly.
            children: [
              // Placeholder for image or graphic
              Positioned(
                left: 107, // These exact positions might not center well on all screen sizes
                top: 165,
                child: Container(
                  width: 215,
                  height: 215,
                  // MODIFIED PART: Added Image.asset
                  child: Image.asset(
                    'assets/images/delete.png', // <<< YOUR IMAGE PATH HERE
                    fit: BoxFit.contain, // Adjust fit as needed (cover, fill, contain, etc.)
                    // You can add a placeholder or error widget for Image.asset as well
                    // errorBuilder: (context, error, stackTrace) {
                    //   return const Icon(Icons.error_outline, size: 50, color: Colors.red);
                    // },
                  ),
                  // If you need a border or specific decoration around the image:
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey),
                  //   borderRadius: BorderRadius.circular(8), // Optional: if you want rounded image corners
                  // ),
                  // clipBehavior: Clip.antiAlias, // If using borderRadius on the image container
                ),
              ),
              // Confirmation Text
              Positioned(
                left: 43,
                top: 403,
                child: SizedBox(
                  width: 343,
                  height: 103, // Text might not always need a fixed height
                  child: const Text( // Added const
                    'Are you sure you want to delete your account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // Warning Text
              Positioned(
                left: 65,
                top: 492,
                child: SizedBox(
                  width: 299,
                  height: 34, // Text might not always need a fixed height
                  child: const Text( // Added const
                    'This action can’t be undone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF77787F),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Cancel Button
              Positioned(
                left: 33,
                top: 594,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Cancel action
                  },
                  child: Container(
                    width: 163,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide( // Added const
                          width: 2,
                          color: Color(0xFF214FAC),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center( // Added const
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF1F41BB),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Delete Button
              Positioned(
                left: 232,
                top: 594,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Add actual delete account logic here
                    // This should likely involve:
                    // 1. Showing a final confirmation (optional, but good practice for destructive actions)
                    // 2. Calling an API to delete the user's account from the backend
                    // 3. Handling success: Navigate to login/initial screen, clear user data
                    // 4. Handling failure: Show an error message
                    print('Delete button tapped - Implement actual deletion logic');
                  },
                  child: Container(
                    width: 163,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF24822), // Added const
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center( // Added const
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

