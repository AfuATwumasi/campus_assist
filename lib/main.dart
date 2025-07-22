import 'package:flutter/material.dart';

// Reports Screen
import 'screens/reports/new_report_screen.dart';
import 'screens/reports/report_submitted_screen.dart';
import 'screens/reports/my_reports_screen.dart';
import 'screens/reports/report_details_screen.dart';

//Welcome & Home
import 'screens/welcome_and_home/welcome_screen.dart';
import 'screens/welcome_and_home/home_screen.dart';
import 'screens/welcome_and_home/settings_page.dart';

//Profile
import 'screens/profile//edit_profile_screen.dart';

// Authentication
import 'screens/authentication/login_screen.dart';
import 'screens/authentication/register_screen.dart';


// Lost & Found Screens
import 'screens/lost_and_found/campus_lost_found_screen.dart';
import 'screens/lost_and_found/browse_found_items_screen.dart';
import 'screens/lost_and_found/lost_item_form_screen.dart';
import 'screens/lost_and_found/found_item_form_screen.dart';

// Settings


void main() {
  runApp(const CampusAssistApp());
}

class CampusAssistApp extends StatelessWidget {
  const CampusAssistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Assist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F41BB)),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),

       initialRoute: '/welcome',
routes: {
        // Auth & Home
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => CampusSafetyHomePage(),

        // Incident Reporting
        '/new_report': (context) => const NewReportScreen(),
        '/submitted': (context) => const ReportSubmittedScreen(),
        '/my_reports': (context) => const MyReportsScreen(),
        '/report_details': (context) => const ReportDetailsScreen(),

        // Lost & Found
        '/lost_found': (context) => CampusLostFoundScreen(),
        '/browse_items': (context) => BrowseFoundItemsScreen(),
        '/lost_form': (context) => LostItemFormScreen(),
        '/found_form': (context) => FoundItemFormScreen(),

        // Settings (fixed name here!)
        '/settings': (context) => const SettingsPage(),
        '/edit_profile': (context) => const EditProfileScreen(),
      },


    );
  }
}

