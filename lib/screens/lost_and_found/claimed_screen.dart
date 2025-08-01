import 'package:flutter/material.dart';

class ClaimedItemScreen extends StatelessWidget {
  const ClaimedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F41BB),
      body: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFF1F41BB),
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
                      left: 109,
                      top: 44,
                      child: Container(
                        width: 211,
                        height: 191,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 26,
                      top: 269,
                      child: SizedBox(
                        width: 377,
                        height: 50,
                        child: Text(
                          'Provide proof of ownership  or identifying details about the item (eg. brand, unique marks,)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF646372),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            height: 1.12,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 322,
                      child: Container(
                        width: 343,
                        height: 151,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF3F3FA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xFFC7C7C7),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 66,
                      top: 547,
                      child: Container(
                        width: 306,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: Color(0xFF1F41BB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 141,
                      top: 553,
                      child: SizedBox(
                        width: 157,
                        height: 26,
                        child: Text(
                          'Submit Claim',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 66,
                      top: 614,
                      child: Container(
                        width: 306,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xFFBEBEBE),
                            ),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 183,
                      top: 618,
                      child: SizedBox(
                        width: 89,
                        height: 26,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 19,
                      top: 688,
                      child: Container(
                        width: 390,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 39,
              child: Container(
                width: 52,
                height: 55,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              left: 44,
              top: 48,
              child: SizedBox(
                width: 344,
                height: 55,
                child: Text(
                  'Claimed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
