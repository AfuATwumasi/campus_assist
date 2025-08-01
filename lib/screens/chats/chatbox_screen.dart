import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            // Profile Image
            Positioned(
              left: 83,
              top: 50,
              child: Container(
                width: 55,
                height: 49,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://placehold.co/55x49"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                ),
              ),
            ),

            // Name
            const Positioned(
              left: 154,
              top: 56,
              child: SizedBox(
                width: 111,
                child: Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Online Status
            const Positioned(
              left: 154,
              top: 78,
              child: SizedBox(
                width: 93,
                child: Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xFFA7A7AC),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            // Message 1 - Sent
            Positioned(
              left: 100,
              top: 132,
              child: Container(
                width: 306,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFF8399E1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Hi, i believe you found my backpack. I can provide proof of ownership',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.21,
                    ),
                  ),
                ),
              ),
            ),

            // Message 2 - Received
            Positioned(
              left: 22,
              top: 213,
              child: Container(
                width: 302,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                  child: Text(
                    'Hello, yes i have it. Please describe it to me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.21,
                    ),
                  ),
                ),
              ),
            ),

            // Message 3 - Sent
            Positioned(
              left: 100,
              top: 284,
              child: Container(
                width: 306,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFF8399E1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'It is blue bag with a torn side pocket and something and another thing and a lot of books in it ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.21,
                    ),
                  ),
                ),
              ),
            ),

            // Message 4 - Received
            Positioned(
              left: 22,
              top: 374,
              child: Container(
                width: 302,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                  child: Text(
                    'That’s correct. Where can you meet me to pick it up?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.21,
                    ),
                  ),
                ),
              ),
            ),

            // Message input field
            Positioned(
              left: 29,
              bottom: 24,
              child: Container(
                width: 337,
                height: 39,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFC7C7C7),
                    width: 1,
                  ),
                ),
              ),
            ),

            // Placeholder text
            const Positioned(
              left: 49,
              bottom: 32,
              child: Text(
                'Type something here',
                style: TextStyle(
                  color: Color(0xFFA8A8A8),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.21,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
