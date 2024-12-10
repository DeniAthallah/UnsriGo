import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'userprovider.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<UserProvider>(context).notifications;

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
          // Content Area
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(context),
                  SizedBox(height: 20), // Space below the top bar
                  // Display all notifications
                  for (var notification in notifications)
                    _buildNotificationCard(
                      context,
                      title: notification["title"] ?? "Notifikasi Baru",
                      status: notification["status"] ?? "",
                      icon: Icons.notifications_active,
                      statusColor: Colors.green,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      child: Stack(
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
          // Title and Info Icon
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Info Icon with Shadow
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 100.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 39,
                  ),
                ),
                SizedBox(width: 8), // Space between icon and text
                // Title with Shadow
                Text(
                  "Notifikasi",
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
    );
  }

  Widget _buildNotificationCard(BuildContext context,
      {required String title,
      required String status,
      required IconData icon,
      required Color statusColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon
              Icon(
                icon,
                size: 36,
                color: Colors.orange[800],
              ),
              SizedBox(width: 16),
              // Title and Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              // More Icon (if necessary)
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
