import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111116)), // Icon color to match title
          onPressed: () {
            Navigator.pop(context); // This will take user to the previous screen (SettingsScreen)
          },
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Color(0xFF111116),
            fontSize: 18,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            // height: 1.28, // Height is less common in AppBar titles, can be removed
          ),
        ),
        backgroundColor: Colors.white, // AppBar background color
        elevation: 0, // Remove shadow if you want a flat look
        centerTitle: true, // To match your original title's centering
      ),
      body: Stack(
        children: [
          // Current Password Section - Adjust top values if using AppBar
          Positioned(
            // If you keep the AppBar, the top of the body is below the AppBar.
            // Original top: 184. AppBar height is typically kToolbarHeight (56.0).
            // Title in body was at top: 72.
            // New top for content could be 184 - 72 = 112 from the start of the Stack,
            // or think relative to the screen.
            // Let's adjust relative to the new layout without the body title.
            top: 40, // Example adjustment, fine-tune as needed
            left: 0,
            right: 0, // Ensure it spans width for centering if needed by _PasswordInputField
            child: _PasswordInputField(
              label: 'Current Password',
              hint: 'Enter current password',
              width: 270, // This width might need to be dynamic or the parent centered
            ),
          ),
          // New Password Section
          Positioned(
            top: 152, // 40 + 112 (height of _PasswordInputField)
            left: 0,
            right: 0,
            child: _PasswordInputField(
              label: 'New Password',
              hint: 'Enter new password',
              width: 270,
            ),
          ),
          // Confirm Password Section
          Positioned(
            top: 264, // 152 + 112
            left: 0,
            right: 0,
            child: _PasswordInputField(
              label: 'Confirm New Password',
              hint: 'Confirm new password',
              width: 263,
            ),
          ),
          // Update Button
          Positioned(
            top: 376, // 264 + 112
            left: 0,
            right: 0,
            // The Container for the button already has width: 428 and padding,
            // which might be wider than screen on smaller devices.
            // Consider centering it or making it responsive.
            child: Padding( // Added Padding for centering the button content
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                // width: 428, // This can be removed if using left/right 0 on Positioned and centering inner content
                height: 72,
                padding: const EdgeInsets.symmetric(vertical: 12), // Removed horizontal for outer
                child: Center( // Center the button
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 84, maxWidth: 480),
                    child: Container(
                      width: double.infinity, // Make button take available width within ConstrainedBox
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF113FC1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Update Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Removed the original Positioned Text title as it's now in the AppBar
        ],
      ),
    );
  }
}

// _PasswordInputField class remains the same for now, but ensure its layout
// works well if its parent Positioned uses left:0, right:0 for centering.
// You might need to wrap the content of _PasswordInputField's build method
// in a Center widget or adjust its internal alignment if 'width: 428'
// is meant to be fixed and centered.

class _PasswordInputField extends StatelessWidget {
  final String label;
  final String hint;
  final double width; // This width is for the inner SizedBox containing the hint text

  const _PasswordInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Wrap with Center if the whole input field block needs to be centered
    // when using Positioned with left:0, right:0
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480), // Max width for the whole field
        child: Container(
          width: 428, // Fixed width for the outer container of the input field
          height: 112,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF111116),
                  fontSize: 16,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0xFFDBDDE5)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: SizedBox( // This SizedBox uses the 'width' parameter
                        width: width,
                        child: Text( // This should be a TextField
                          hint,
                          style: const TextStyle(
                            color: Color(0xFF636B87),
                            fontSize: 16,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
