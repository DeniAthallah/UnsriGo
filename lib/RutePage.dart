import 'package:flutter/material.dart';

class Rutepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // InteractiveViewer for Panning and Zooming the Map Image
          InteractiveViewer(
            boundaryMargin: EdgeInsets.all(100), // Allows panning beyond the screen edges
            minScale: 4.0, // Minimum scale (no zoom out below the original size)
            maxScale: 4.0, // Maximum scale (allows zooming up to 4x the original size)
            child: Image.asset(
              'assets/map.png', // Your map image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Overlay Image (top2.png remains here)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/top2.png', // Original overlay image
              fit: BoxFit.cover,
              height: 300, // Height of the overlay image
            ),
          ),

          // DraggableScrollableSheet for Bus Schedule List
          DraggableScrollableSheet(
            initialChildSize: 0.25, // Show only 1/4 of the screen initially
            minChildSize: 0.25, // Minimum size when sheet is scrolled down
            maxChildSize: 0.9, // Maximum size when sheet is scrolled up
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFFFFC107),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    _buildBusSchedule("07:00 - 09:00", ["01", "07", "11"], "No Bus", Colors.green),
                    SizedBox(height: 16),
                    Text(
                      "Jadwal Lainnya",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildBusSchedule("11:00 - 13:00", ["01", "07", "11"], "Bis Kedatangan", Colors.red),
                    SizedBox(height: 16),
                    _buildBusSchedule("09:00 - 11:00", ["01", "07", "11"], "Bis Kedatangan", Colors.red),
                  ],
                ),
              );
            },
          ),

          // Top Bar with Back Button, Title, and Notification Bell
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/back.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                // Title
                Row(
                  children: [
                    Icon(Icons.info, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Rute",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Notification Bell Icon
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display each bus schedule block
  Widget _buildBusSchedule(String time, List<String> busNumbers, String statusLabel, Color busColor) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF143C5E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bus Tersedia ($time)",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_pin, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "Halte A Kampus Bukit",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$statusLabel :",
                  style: TextStyle(
                    color: Color(0xFF143C5E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: busNumbers
                      .map((busNumber) => _buildBusNumber(busNumber, busColor))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display each bus number with green background and rounded corners
  Widget _buildBusNumber(String number, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        number,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
