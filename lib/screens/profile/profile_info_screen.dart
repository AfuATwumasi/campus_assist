import 'package:flutter/material.dart';

// Changed to StatefulWidget to manage the state of TextFields
class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  // Controllers for each text field
  late TextEditingController _nameController;
  late TextEditingController _studentIdController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  // To keep track of whether the user is in "edit mode"
  bool _isEditing = false;

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
    _nameController.dispose();
    _studentIdController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  // Toggles editing mode and saves data if exiting edit mode
  void _toggleEditSave() {
    setState(() {
      if (_isEditing) {
        // TODO: Implement actual save logic here
        // For example, call an API to update user profile
        print("Saving data...");
        print("Name: ${_nameController.text}");
        print("Student ID: ${_studentIdController.text}");
        print("Email: ${_emailController.text}");
        print("Phone: ${_phoneNumberController.text}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile information saved!')),
        );
      }
      _isEditing = !_isEditing;
    });
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
          color: const Color(0xFF1F41BB), // Redundant if Scaffold bg is the same
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50), // Round top corners
                    // bottom: Radius.circular(50), // Bottom might be part of scroll
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage("https://placehold.co/128x128"),
                        // child: Icon(Icons.person, size: 64), // Fallback
                      ),
                      const SizedBox(height: 20),

                      // Name Field
                      _buildLabel("Name"),
                      _buildField(
                        controller: _nameController,
                        hintText: "Enter your name",
                        readOnly: !_isEditing, // Editable only in edit mode
                      ),

                      // Student ID
                      _buildLabel("Student ID"),
                      _buildField(
                        controller: _studentIdController,
                        hintText: "Student ID",
                        readOnly: true, // Student ID is often not editable by user
                      ),

                      // Email
                      _buildLabel("Email"),
                      _buildField(
                        controller: _emailController,
                        hintText: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                        readOnly: !_isEditing,
                      ),

                      // Phone Number
                      _buildLabel("Phone Number"),
                      _buildField(
                        controller: _phoneNumberController,
                        hintText: "Enter your phone number",
                        keyboardType: TextInputType.phone,
                        readOnly: !_isEditing,
                      ),

                      const SizedBox(height: 40),

                      // Save/Edit Button (If you want an explicit button)
                      // If not, the edit icon in the app bar can handle toggling edit mode.
                      // Example of an explicit Save Button:
                      if (_isEditing)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: _toggleEditSave, // This will save and exit edit mode
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1F41BB),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20), // Spacer if button is present
                    ],
                  ),
                ),
              ),
            ),

            // Top Bar
            Positioned(
              top: 66, // Adjust based on SafeArea if necessary
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () {
                        if (_isEditing) {
                          // Optionally, ask for confirmation if there are unsaved changes
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Unsaved Changes'),
                              content: const Text('Do you want to discard changes and go back?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Discard'),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(); // Close dialog
                                    Navigator.of(context).pop(); // Go back
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      tooltip: 'Back',
                    ),
                    const Spacer(),
                    const Text(
                      'Profile Info',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(), // Use one Spacer to push Edit/Save icon to the right
                    IconButton(
                      icon: Icon(_isEditing ? Icons.save_alt_outlined : Icons.edit_outlined, color: Colors.white, size: 26),
                      onPressed: _toggleEditSave,
                      tooltip: _isEditing ? 'Save Profile' : 'Edit Profile',
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

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
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
    bool readOnly = false, // Default to not read-only for ProfileInfoScreen
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 6),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: readOnly ? const Color(0xFFF1F4FF) : Colors.white, // Different bg if editable
          borderRadius: BorderRadius.circular(10),
          border: readOnly ? null : Border.all(color: Colors.grey.shade300), // Border if editable
        ),
        child: TextField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          style: TextStyle(
            color: readOnly ? const Color(0xFF77787F) : const Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF77787F).withOpacity(0.7),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF77787F)) : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ),
    );
  }
}
