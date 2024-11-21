import 'package:flutter/material.dart';
import 'bus_booking_detail_pageB.dart';

class BusBookingSelectPageB extends StatefulWidget {
  const BusBookingSelectPageB({Key? key}) : super(key: key);

  @override
  State<BusBookingSelectPageB> createState() => _BusBookingSelectPageState();
}

class _BusBookingSelectPageState extends State<BusBookingSelectPageB> {
  int? selectedSeat; // Variable to hold the selected seat number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Select Seat"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Pops the current page off the stack, returning to the HomePage
          },
          color: const Color(0xFFFFC107),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegend(const Color(0xFFFFC107), "Standard"),
                _buildLegend(Colors.green, "Selected"),
                _buildLegend(Colors.grey[400]!, "Taken"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSeatRow([1, 2, null, 3, 4]),
                      const SizedBox(height: 8),
                      _buildSeatRow([5, 6, null, 7, 8]),
                      const SizedBox(height: 8),
                      _buildSeatRow([9, 10, null, 11, 12]),
                      const SizedBox(height: 8),
                      _buildSeatRow([13, 14, null, 15, 16]),
                      const SizedBox(height: 8),
                      _buildSeatRow([17, 18, null, 19, 20]),
                      const SizedBox(height: 8),
                      _buildSeatRow([21, 22, null, 23, 24]),
                      const SizedBox(height: 8),
                      _buildSeatRow([25, 26, null, 27, 28]),
                      const SizedBox(height: 8),
                      _buildSeatRow([29, 30, null, 31, 32]),
                      const SizedBox(height: 8),
                      _buildSeatRow([33, 34, 35, 36, 37]),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSeatRow(List<int?> seatNumbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: seatNumbers.map((number) {
        if (number == null) {
          return const SizedBox(width: 48); // Spacer for gap
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSeat = number; // Update selected seat
              });
            },
            child: _GeneralSeatComponent(
              title: number.toString(),
              borderColor: selectedSeat == number
                  ? Colors.green
                  : const Color(0xFFFFC107), // Green if selected
            ),
          );
        }
      }).toList(),
    );
  }

  Widget _buildBottomBar() {
    return SizedBox(
      height: 84,
      child: BottomAppBar(
        elevation: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Text(
                "Seat: ${selectedSeat ?? 'None'}", // Display selected seat
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (selectedSeat != null) {
                      // Navigate to BusBookingDetailPage if seat is selected
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BusBookingDetailPageB(selectedSeat: selectedSeat!),
                        ),
                      );
                    } else {
                      // Optionally show a message to select a seat
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a seat first!")),
                      );
                    }
                  },
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 191, 0),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class _GeneralSeatComponent extends StatelessWidget {
  final String? title;
  final Color borderColor;

  const _GeneralSeatComponent({
    Key? key,
    this.title,
    this.borderColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          title ?? "",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
