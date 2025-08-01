import 'package:campus_assist/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import '../profile/delete_account_screen.dart';
import '../profile/help_faq_screen.dart';
import '../profile/contact_support.dart';
import '../profile/change_password.dart';
import '../profile/logout_screen.dart';
import '../profile/about_screen.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _campusAlerts = false;
  bool _lostAndFound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight - 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CampusSafetyHomePage(),
                          ),
                              (Route<dynamic> route) => false,
                        );
                      },
                      tooltip: 'Back to Home',
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage('https://placehold.co/128x128'),
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Ethan Carter',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0C141C),
                            ),
                          ),
                          const Text(
                            'ethan.carter@email.com',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF49729B),
                            ),
                          ),
                          const SizedBox(height: 0),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfileScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: const BorderSide(color: Color(0xFFCBD4E1)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 90,
                                vertical: 4,
                              ),
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0xFF1F41BB),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0),
                    _buildSectionTitle('Account Settings'),
                    _buildListTile(Icons.person_outline, 'Profile info'),
                    _buildListTile(Icons.lock_outline, 'Change password'),

                    const SizedBox(height: 0),
                    _buildSectionTitle('App Preferences'),
                    _buildToggleTile('Campus Alerts', _campusAlerts, (val) {
                      setState(() => _campusAlerts = val);
                    }),
                    _buildToggleTile('Lost & Found Update', _lostAndFound, (val) {
                      setState(() => _lostAndFound = val);
                    }),

                    const SizedBox(height: 0),
                    _buildSectionTitle('Privacy & Security'),
                    _buildListTile(Icons.delete_outline, 'Delete Account'),

                    const SizedBox(height: 0),
                    _buildSectionTitle('Support'),
                    _buildListTile(Icons.help_outline, 'Help & FAQs'),
                    _buildListTile(Icons.mail_outline, 'Contact Support'),
                    _buildListTile(Icons.info_outline, 'About CampusAssist'),

                    const SizedBox(height: 0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogoutConfirmationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F41BB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 4,
                          ),
                          elevation: 10,
                          shadowColor: const Color(0xFFCAD6FF),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String text) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (text == 'Delete Account') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DeleteAccountScreen(),
            ),
          );
        } else if (text == 'Profile info') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        } else if (text == 'Change password') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChangePasswordScreen(),
            ),
          );
        } else if (text == 'Help & FAQs') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpFaqsScreen(),
            ),
          );
        } else if (text == 'Contact Support') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactSupportScreen(),
            ),
          );
        } else if (text == 'About CampusAssist') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CampusAssistScreen(),
            ),
          );
        }
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF0C141C),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildToggleTile(String text, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF1F41BB),
    );
  }
}
