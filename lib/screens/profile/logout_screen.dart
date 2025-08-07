import 'package:flutter/material.dart';

import '../authentication/login_screen.dart';
import '../welcome_and_home/welcome_screen.dart';
// If using SVG, you might need flutter_svg package:
// import 'package:flutter_svg/flutter_svg.dart';

// TODO: IMPORT YOUR SIGN_IN_SCREEN WIDGET HERE
// Example: import 'package:your_app_name/screens/auth/sign_in_screen.dart';

class LogoutConfirmationScreen extends StatelessWidget {
  const LogoutConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for more responsive layout if needed
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(0.5), // Optional: Dim background for dialog feel
      body: Center( // Center the dialog content on the screen
        child: Container(
          width: 428, // Max width for the dialog
          // height: 926, // Avoid fixed height, let it wrap content or use constraints
          constraints: const BoxConstraints(
            maxWidth: 400, // More typical dialog width
            minHeight: 300, // Optional: ensure a minimum height
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24), // Standard dialog rounding
            ),
            // Optional: Add a subtle shadow
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          // Use Padding for internal spacing of the content
          padding: const EdgeInsets.all(24.0),
          child: Column( // Main layout for dialog content
            mainAxisSize: MainAxisSize.min, // Make column take minimum necessary height
            crossAxisAlignment: CrossAxisAlignment.stretch, // Make children stretch horizontally
            children: [
              // --- IMAGE PLACEMENT ---
              Image.asset(
                'assets/images/logout.png', // <<< YOUR IMAGE PATH HERE
                height: 180, // Adjust height as needed
                width: 120,  // Adjust width as needed
              ),
              const SizedBox(height: 24), // Spacing after the image

              // Confirmation Text
              const Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF111116),
                  fontSize: 20,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 24), // Spacing after text

              // Logout Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1442C6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  // --- MODIFIED NAVIGATION LOGIC ---
                  print("Logout button tapped - Navigating to Sign In");

                  // TODO: Implement actual logout logic (e.g., clear user session, tokens)
                  // For example, if you are using a state management solution like Provider or Riverpod,
                  // you would call a method to clear the authentication state here.
                  // authProvider.logout();

                  // Navigate to the SignInScreen and remove all routes beneath it
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()), // Replace SignInScreen with your actual sign-in page widget
                        (Route<dynamic> route) => false, // This predicate removes all routes
                  );
                },
                child: const Text('Logout'),
              ),
              const SizedBox(height: 12),

              // Cancel Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF111116),
                  backgroundColor: const Color(0xFFEFF2F4),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the logout confirmation dialog
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy SignInScreen for demonstration purposes.
// Replace this with your actual SignInScreen import and widget.
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Center(
        child: Text(
          'This is the Sign In Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
