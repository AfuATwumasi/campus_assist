import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userPhone;
  final String userImage;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.userPhone,
    required this.userImage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> _messages = []; // start empty

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': _controller.text.trim(),
        'isSentByMe': true,
      });
      _controller.clear();
    });
  }

  void _makeCallConfirmation() async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Make a call"),
        content: Text("Do you want to call ${widget.userName}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final Uri phoneUri = Uri.parse('tel:${widget.userPhone}');
              if (await canLaunchUrl(phoneUri)) {
                await launchUrl(phoneUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cannot make the call")),
                );
              }
            },
            child: const Text("Call"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Header - back, avatar, name, status, call
            Positioned(
              top: 60,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
              ),
            ),
            Positioned(
              top: 50,
              left: 83,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.userImage),
              ),
            ),
            Positioned(
              top: 56,
              left: 154,
              child: Text(
                widget.userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              top: 78,
              left: 154,
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
            // Call icon
            Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                onTap: _makeCallConfirmation,
                child: const Icon(Icons.phone, color: Colors.black, size: 26),
              ),
            ),

            // Message List
            Positioned.fill(
              top: 110,
              bottom: 80,
              left: 0,
              right: 0,
              child: _messages.isEmpty
                  ? const Center(
                child: Text(
                  "Start a new conversation",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isSent = msg['isSentByMe'] as bool;
                  return Align(
                    alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(14),
                      constraints: const BoxConstraints(maxWidth: 300),
                      decoration: BoxDecoration(
                        color: isSent ? const Color(0xFF8399E1) : const Color(0xFFF4F4FA),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        msg['text'],
                        style: TextStyle(
                          color: isSent ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: isSent ? FontWeight.w500 : FontWeight.w400,
                          height: 1.21,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Input Box
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFC7C7C7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type something here',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: const Icon(Icons.send, color: Color(0xFF1F41BB)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
