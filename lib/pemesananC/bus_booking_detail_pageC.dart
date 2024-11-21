import 'package:flutter/material.dart';
import 'package:flutter_application_unsrigo/selesai.dart';

class BusBookingDetailPage extends StatefulWidget {
  final int selectedSeat;

  const BusBookingDetailPage({Key? key, required this.selectedSeat}) : super(key: key);

  @override
  _BusBookingDetailPageState createState() => _BusBookingDetailPageState();
}

class _BusBookingDetailPageState extends State<BusBookingDetailPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/top2.png',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80), // Adjusted to raise the column
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar with Back Button, Title, and Notification
                  Stack(
                    children: [
                      // Back Button
                      Positioned(
                        left: 16,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/back.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      // Title with Info Icon
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.white,
                              size: 39,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Pembayaran",
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
                      // Notification Icon
                      Positioned(
                        right: 16,
                        top: 0,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  // Booking and Payment Details
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Trip Details Box
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("10.30",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text("Palembang",
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("12.15",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text("Indralaya",
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  // Display Selected Seat Number
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Kursi ${widget.selectedSeat}", // Use selectedSeat here
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),

                        // Payment Method Section
                        Text("Metode Pembayaran",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),

                        // Payment Method Options
                        Column(
                          children: [
                            _buildPaymentMethodTile('Gopay', 'assets/payment/gopay.png'),
                            _buildPaymentMethodTile('OVO', 'assets/payment/OVO.png'),
                            _buildPaymentMethodTile('Dana', 'assets/payment/dana.png'),
                            _buildPaymentMethodTile('Alfamart', 'assets/payment/Alfamart.png'),
                            _buildPaymentMethodTile('Indomaret', 'assets/payment/indomaret.png'),
                            _buildPaymentMethodTile('Mobile Banking', 'assets/payment/mobile.png'),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Pay Now Button
                        SizedBox(height: 20),

                        // Pay Now Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: selectedPaymentMethod != null
                                ? () {
                                    // Navigasi ke halaman Selesai
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Selesai()),
                                    );
                                  }
                                : null, // Disable if no method selected
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Bayar Sekarang",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
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

  // Helper method to build payment method tiles
  Widget _buildPaymentMethodTile(String title, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title; // Update selected payment method
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == title ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          border: selectedPaymentMethod == title
              ? Border.all(color: Colors.blue, width: 2)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              assetPath,
              height: 24,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedPaymentMethod == title ? Colors.blue : Colors.black),
            ),
            SizedBox.shrink(), // Placeholder for alignment
          ],
        ),
      ),
    );
  }
}
