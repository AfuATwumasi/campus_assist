import 'package:flutter/material.dart';

// Changed to StatefulWidget to manage the state of TextFields
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for each text field
  late TextEditingController _nameController;
  late TextEditingController _studentIdController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current/default values
    // In a real app, you would likely fetch this data (e.g., from a user profile)
    _nameController = TextEditingController(text: "James Atta Nii Johnson");
    _studentIdController = TextEditingController(text: "1702733");
    _emailController = TextEditingController(text: "jamesataanii@st.knust.edu.gh");
    _phoneNumberController = TextEditingController(text: "055 555 5555");
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    // to prevent memory leaks
    _nameController.dispose();
    _studentIdController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF1F41BB), // This seems redundant if Scaffold's bg is the same
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 158,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 158,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical( // Consider only rounding top corners
                    top: Radius.circular(50),      // if the bottom extends off-screen in scroll
                    // bottom: Radius.circular(50), // This might be hidden by scroll content
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20, bottom: 50), // Added top padding
                  child: Column(
                    children: [
                      // const SizedBox(height: 20), // Moved SizedBox inside SingleChildScrollView's padding
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage("https://placehold.co/128x128"),
                        // Consider adding a child Icon as a fallback or placeholder
                        // child: Icon(Icons.person, size: 64, color: Colors.white70),
                      ),
                      const SizedBox(height: 20),

                      // Name Field
                      _buildLabel("Name"),
                      _buildField(
                        controller: _nameController,
                        hintText: "Enter your name",
                      ),

                      // Student ID (Typically read-only after initial setup)
                      _buildLabel("Student ID"),
                      _buildField(
                        controller: _studentIdController,
                        hintText: "Enter your student ID",
                        readOnly: true, // Example: Student ID is often not user-editable
                      ),

                      // Email
                      _buildLabel("Email"),
                      _buildField(
                        controller: _emailController,
                        hintText: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                      ),

                      // Phone Number
                      _buildLabel("Phone Number"),
                      _buildField(
                        controller: _phoneNumberController,
                        hintText: "Enter your phone number",
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 40),

                      // Save Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle save logic
                            // Access the updated values using the controllers:
                            final String name = _nameController.text;
                            final String studentId = _studentIdController.text;
                            final String email = _emailController.text;
                            final String phoneNumber = _phoneNumberController.text;

                            // TODO: Implement your save logic (e.g., API call, local storage)
                            print("Saving Profile:");
                            print("Name: $name");
                            print("Student ID: $studentId");
                            print("Email: $email");
                            print("Phone Number: $phoneNumber");

                            // Optionally, show a confirmation message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Profile saved!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F41BB),
                            minimumSize: const Size.fromHeight(60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: const Color(0xFFCAD6FF),
                            elevation: 10,
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Top Bar
            Positioned(
              top: 66, // Consider using SafeArea for dynamic positioning
              left: 0,
              right: 0,
              child: Padding( // Added Padding for better spacing of Row elements
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    // const SizedBox(width: 20), // Replaced by Padding on Row
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: 'Back', // Added tooltip for accessibility
                    ),
                    const Spacer(),
                    const Text(
                      'Edit Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(flex: 2), // Balances the title when IconButton is present
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35, bottom: 8), // Adjusted bottom padding
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF333333), // Slightly darker for better contrast
            fontSize: 18, // Slightly reduced font size for label
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Updated _buildField to use TextField and a controller
  Widget _buildField({
    required TextEditingController controller,
    String hintText = "",
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon, // Optional prefix icon
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 6), // Added vertical padding
      child: Container(
        // height: 51, // Height is now more dynamic with TextField
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4FF),
          borderRadius: BorderRadius.circular(10), // Slightly more rounded corners
        ),
        child: TextField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Color(0xFF333333), // Darker text for editable field
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF77787F).withOpacity(0.7),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Color(0xFF77787F)) : null,
            border: InputBorder.none, // Removes the default underline
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Adjust padding
          ),
        ),
      ),
    );
  }
}

