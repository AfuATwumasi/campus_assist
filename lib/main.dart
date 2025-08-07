import 'package:campus_assist/screens/chats/message_screen.dart';
import 'package:campus_assist/screens/profile/help_faq_screen.dart';
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
import 'screens/lost_and_found/claimed_screen.dart';


// Settings
import 'screens/profile/delete_account_screen.dart';
import 'screens/profile/help_faq_screen.dart';
import 'screens/profile/change_password.dart';
import 'screens/profile/contact_support.dart';
import 'screens/profile/about_screen.dart';
import 'screens/profile/logout_screen.dart';
import 'screens/profile/profile_info_screen.dart';

//Chats
import 'screens/chats/message_screen.dart';
import 'screens/chats/chatbox_screen.dart';
import 'screens/chats/item_found.dart';
//Feedback
import 'screens/welcome_and_home/feedback_screen (1).dart';


//Alert
import 'screens/alert/campusalerts_screen (1).dart';

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
        '/feedback': (context) => FeedbackPage(),
        '/campus_alert_page': (context) => CampusAlertsScreen(),

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
        '/item_found': (context) => FoundItemDetailsScreen(),
        '/claimed': (context) => ClaimedItemScreen(),

        // Settings (fixed name here!)
        '/settings': (context) => const SettingsScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/profile_info': (context) => const ProfileInfoScreen(),
        '/delete_account': (context) => const DeleteAccountScreen(),
        '/help': (context) => const HelpFaqsScreen(),
        'change_password': (context) => const ChangePasswordScreen(),
        'contact_support': (context) => const ContactSupportScreen(),
        'about': (context) => const CampusAssistScreen(),
        'logout': (context) => const LogoutConfirmationScreen(),

        //Messages
        '/messages': (context) => const MessagesScreen(),
        '/chatbox': (context) => const ChatScreen(userName: '', userPhone: '', userImage: '',),

      },





    );
  }
}

