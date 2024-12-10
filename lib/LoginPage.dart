import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/top2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // Back Button
                      Positioned(
                        left: 16,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Action for back button
                          },
                          child: Image.asset(
                            'assets/back.png', // Path to your back arrow image
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Info Icon with Shadow
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.info,
                                color: Colors.white,
                                size: 39,
                              ),
                            ),
                            SizedBox(width: 8), // Space between icon and text
                            // Title with Shadow
                            Text(
                              "Informasi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 4.0,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 0),
                  // Main Content (Logo and Options)
                  Center(
                    child: Column(
                      children: [
                        // UG Logo
                        Image.asset(
                          'assets/ug.png', // Replace with your logo asset path
                          width: 1000, // Adjusted width for better layout
                          height: 300,
                        ),
                        SizedBox(height: 20),
                        // Contact UG Section
                        ExpansionTile(
                          title: Text(
                            "Kontak UG",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(
                                      0xFF235680), // Background color blue
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // Directly center the text inside the container
                                  child: Text(
                                    "Hubungi UG Bro",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(
                                      0xFF235680), // Background color blue
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // Directly center the text inside the container
                                  child: Text(
                                    "Laporkan Masalah",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Participating Institutions Section
                        ExpansionTile(
                          title: Text(
                            "Lembaga Berpartisipasi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                           Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(
                                      0xFF235680), // Background color blue
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // Directly center the text inside the container
                                  child: Text(
                                    "Universitas Sriwijaya",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(
                                      0xFF235680), // Background color blue
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // Directly center the text inside the container
                                  child: Text(
                                    "Damri",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Footer Text 'Unsri GO 2024'
                        SizedBox(height: 30),
                        Text(
                          'Unsri GO 2024',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
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

