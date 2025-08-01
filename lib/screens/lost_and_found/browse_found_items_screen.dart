// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BrowseFoundItemsScreen extends StatelessWidget {
  const BrowseFoundItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F41BB),
      body: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF1F41BB),
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
                width: 428,
                height: 768,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 18,
                      top: 26,
                      child: FoundItemCard(
                        context: context,
                        itemName: 'Blue Backpack',
                        description: 'A blue backpack with black zippers and a front pocket.',
                        location: 'Building A',
                        date: 'June 20, 2025',
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 177,
                      child: FoundItemCard(
                        context: context,
                        itemName: 'Water Bottle',
                        description: 'Silver reusable water bottle with stickers.',
                        location: 'Library',
                        date: 'June 21, 2025',
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 328,
                      child: FoundItemCard(
                        context: context,
                        itemName: 'Black Umbrella',
                        description: 'Black foldable umbrella with a curved handle.',
                        location: 'Cafeteria',
                        date: 'June 22, 2025',
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 479,
                      child: FoundItemCard(
                        context: context,
                        itemName: 'Calculator',
                        description: 'Casio scientific calculator with name label.',
                        location: 'Room 204',
                        date: 'June 23, 2025',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 100,
              right: 100,
              child: Text(
                'Browse Found Items',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoundItemCard extends StatelessWidget {
  final BuildContext context;
  final String itemName;
  final String description;
  final String location;
  final String date;

  const FoundItemCard({
    required this.context,
    required this.itemName,
    required this.description,
    required this.location,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 401,
      height: 128,
      decoration: ShapeDecoration(
        color: const Color(0xFFFAF8F8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 15,
            child: Container(
              width: 69,
              height: 67,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 91,
            child: SizedBox(
              width: 84,
              height: 15,
              child: Text(
                location,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 10,
            child: Text(
              itemName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 40,
            child: SizedBox(
              width: 282,
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 91,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 300,
            top: 90,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/item_found');
              },
              child: Container(
                width: 94,
                height: 23,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1F41BB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Claim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
