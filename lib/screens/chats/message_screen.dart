import 'package:flutter/material.dart';
import 'chatbox_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // Original chat data
  final List<Map<String, String>> _allChatData = [
    {'name': 'Liam Carter', 'message': 'Sure, see you then', 'time': '3:45 PM'},
    {'name': 'Sophia Turner', 'message': 'Thanks for helping me find it!', 'time': 'Yesterday'},
    {'name': 'Ethan Bennett', 'message': "I'll be there in 10 minutes", 'time': '2 days ago'},
    {'name': 'Olivia Hayes', 'message': 'No problem, glad I could assist', 'time': '3 days ago'},
    {'name': 'Noah Parker', 'message': "I've already contacted the authorities", 'time': '4 days ago'},
    {'name': 'Ava Mitchell', 'message': "I'll keep an eye out for it", 'time': '5 days ago'},
    {'name': 'Jackson Reed', 'message': "I'm so grateful for your help", 'time': '6 days ago'},
  ];

  // State variables for search
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredChatData = [];

  @override
  void initState() {
    super.initState();
    _filteredChatData = _allChatData; // Initially, show all chats
    _searchController.addListener(_filterChats);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterChats);
    _searchController.dispose();
    super.dispose();
  }

  void _filterChats() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredChatData = _allChatData.where((chat) {
        final nameLower = chat['name']!.toLowerCase();
        final messageLower = chat['message']!.toLowerCase();
        return nameLower.contains(query) || messageLower.contains(query);
      }).toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear(); // Clear search field when closing
        _filteredChatData = _allChatData; // Reset to all chats
      }
      // Optionally, you might want to request focus when search opens
      // if (_isSearching) { FocusScope.of(context).requestFocus(_searchFocusNode); }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back and Search (or Search Bar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Reduced vertical padding a bit
              child: _isSearching ? _buildSearchBar() : _buildHeaderBar(),
            ),

            // Chat List with swipe functionality
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _filteredChatData.length, // Use filtered data
                itemBuilder: (context, index) {
                  final chat = _filteredChatData[index];
                  return Dismissible(
                    key: ValueKey(chat['name']), // Ensure keys are unique if names can repeat
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      bool? result = await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Claim Confirmation'),
                          content: const Text('Has the item been claimed?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                      return result ?? false;
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.redAccent,
                      child: const Icon(Icons.help_outline, color: Colors.white),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Pass actual user data if available, or fetch based on ID
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              userName: chat['name']!,
                              userPhone: '', // Add phone if you have it
                              userImage: '', // Add image if you have it
                            ),
                          ),
                        );
                      },
                      child: chatItem(chat['name']!, chat['message']!, chat['time']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
        const Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black, size: 28),
          onPressed: _toggleSearch,
          tooltip: 'Search',
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () {
            // If you want the back button in search mode to just close search,
            // otherwise it will pop the screen.
            _toggleSearch();
          },
          tooltip: 'Close Search',
        ),
        Expanded(
          child: TextField(
            controller: _searchController,
            autofocus: true, // Automatically focus the search field
            decoration: InputDecoration(
              hintText: 'Search chats...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[600]),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        // Optionally, add a clear button for the search text
        if (_searchController.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear, color: Colors.black54, size: 24),
            onPressed: () {
              _searchController.clear();
            },
            tooltip: 'Clear Search',
          )
        else
          const SizedBox(width: 48), // To keep alignment similar to header when clear is not visible
      ],
    );
  }

  // chatItem method remains the same
  Widget chatItem(String name, String message, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFF1F41BB),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF111116),
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF636D87),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xFF636D87),
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
