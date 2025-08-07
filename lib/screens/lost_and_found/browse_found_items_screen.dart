import 'package:flutter/material.dart';

class BrowseFoundItemsScreen extends StatelessWidget {
  const BrowseFoundItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Browse Found Items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 44,
            right: 44,
            child: Container(
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xFFC4CFF5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontFamily: 'Poppins'),
                      decoration: InputDecoration(
                        hintText: 'Search items here',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  FoundItemCard(
                    itemName: 'Blue Backpack',
                    description: 'Description of the found item',
                    location: 'Building A',
                    date: 'July 21, 2025',
                  ),
                  FoundItemCard(
                    itemName: 'Item Name',
                    description: 'Description of the found item',
                    location: 'Building A',
                    date: 'July 21, 2025',
                  ),
                  FoundItemCard(
                    itemName: 'Item Name',
                    description: 'Description of the found item',
                    location: 'Building A',
                    date: 'July 21, 2025',
                  ),
                  FoundItemCard(
                    itemName: 'Item Name',
                    description: 'Description of the found item',
                    location: 'Building A',
                    date: 'July 21, 2025',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoundItemCard extends StatelessWidget {
  final String itemName;
  final String description;
  final String location;
  final String date;

  const FoundItemCard({
    required this.itemName,
    required this.description,
    required this.location,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFFFAF8F8),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        minimumSize: Size(70, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero,
                        // Add foregroundColor for the text
                        foregroundColor: Colors.white, // <<< THIS IS THE ONLY CHANGE
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/item_found');
                      },
                      child: Text(
                        'Retrieve',
                        style: TextStyle(
                          // color: Colors.white, // This line is now effectively handled by foregroundColor
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
