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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar with Back Button, Info, Title, and Notification
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
                    // Title, Info Icon, and Notification Bell
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
                    // Notification Bell Icon
                    Positioned(
                      right: 16,
                      top: 10,
                      child: Icon(
                        Icons.notifications, // Notification bell icon
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                // Main Content (Logo and Options)
                Center(
                  child: Column(
                    children: [
                      // UG Logo
                      Image.asset(
                        'assets/ug.png', // Replace with your logo asset path
                        width: 500,
                        height: 500,
                      ),

                      // Contact UG and Participating Institutions sections
                      ExpansionTile(
                        title: Text("Kontak UG"),
                        children: [
                          ListTile(
                            title: Text("Informasi kontak UG di sini."),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text("Lembaga Berpartisipasi"),
                        children: [
                          ListTile(
                            title: Text("Daftar lembaga yang berpartisipasi."),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // Footer Text
                Center(
                  child: Text(
                    'Unsri GO 2024',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
