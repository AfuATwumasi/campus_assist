import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header
                  Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create an account and connect with the campus community!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 40),

                  // First Name
                  TextField(
                    controller: _firstNameController,
                    decoration: _inputDecoration('First Name'),
                  ),
                  SizedBox(height: 16),

                  // Last Name
                  TextField(
                    controller: _lastNameController,
                    decoration: _inputDecoration('Last Name'),
                  ),
                  SizedBox(height: 16),

                  // Email
                  TextField(
                    controller: _emailController,
                    decoration: _inputDecoration('Email'),
                  ),
                  SizedBox(height: 16),

                  // Phone Number
                  TextField(
                    controller: _phoneController,
                    decoration: _inputDecoration('Phone number'),
                  ),
                  SizedBox(height: 16),

                  // Password (no border)
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: _inputDecoration('Password', border: false),
                  ),
                  SizedBox(height: 16),

                  // Confirm Password (no border)
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: _inputDecoration('Confirm Password', border: false),
                  ),
                  SizedBox(height: 32),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Already have account
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Already have an account',
                      style: TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  // Or continue with
                  Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _socialLoginButton('assets/images/facebook.png'),
                      _socialLoginButton('assets/images/google.png'),
                      _socialLoginButton('assets/images/apple.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, {bool border = true}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFF999999)),
      filled: true,
      fillColor: Color(0xFFF1F4FF),
      border: border
          ? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF1F41BB), width: 2),
      )
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: border
          ? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF1F41BB), width: 2),
      )
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: border
          ? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF1F41BB), width: 2),
      )
          : OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget _socialLoginButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Handle social signup
      },
      child: Image.asset(
        assetPath,
        height: 60,
        width: 60,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
