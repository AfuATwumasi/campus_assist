import 'package:flutter/material.dart';


class MyReportsScreen extends StatelessWidget {
  const MyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      {
        'title': 'Harassment at Library Entrance',
        'status': 'Submitted',
        'statusColor': const Color(0xFF1F41BB),
        'date': 'June 17, 2025',
      },
      {
        'title': 'Harassment at Library Entrance',
        'status': 'Under Review',
        'statusColor': const Color(0xFFF5AA27),
        'date': 'June 17, 2025',
      },
      {
        'title': 'Harassment at Library Entrance',
        'status': 'Resolved',
        'statusColor': const Color(0xFF1FBB31),
        'date': 'June 17, 2025',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1F41BB),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Stack(
          children: [
            Positioned(
              top: 185,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 741,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 46, left: 21, right: 21),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 32),
                    itemCount: reports.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 35),
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/report_details');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFDBDADA),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report['title'] as String,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                report['date'] as String,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: report['statusColor'] as Color,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    report['status'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Back button (clickable now!)
            Positioned(
              top: 65,
              left: 21,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),

            const Positioned(
              top: 65,
              left: 81,
              child: Text(
                'My Reports',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
