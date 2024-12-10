import 'dart:math'; // Untuk Random
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'userprovider.dart';
import 'HomePage.dart';

class Selesai extends StatelessWidget {
  final DateTime waktuPemesanan = DateTime.now();
  final int selectedSeat;

  Selesai({required this.selectedSeat});

  // Fungsi untuk membuat ID Transaksi acak
  String generateRandomTransactionId() {
    const String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random random = Random();
    return List.generate(8, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        DateFormat('d MMMM yyyy : HH.mm').format(waktuPemesanan);
    String transactionId = generateRandomTransactionId(); // ID Transaksi acak

    return Scaffold(
      body: Stack(
        children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Image.asset(
                      'assets/Berhasil.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Pemesanan Berhasil!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDetailRow("Halte :", "Halte A Bukit"),
                          buildDetailRow("Harga :", "Rp.10.000"),
                          buildDetailRow("Email :",
                              Provider.of<UserProvider>(context).email),
                          buildDetailRow("Status :", "Berhasil",
                              statusColor: Colors.green),
                          buildDetailRow("Waktu Pesan :", formattedTime),
                          buildDetailRow("ID Transaksi :", transactionId),
                          buildDetailRow(
                              "Nomor Kursi :", selectedSeat.toString()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan transaksi ke riwayat
                          Provider.of<UserProvider>(context, listen: false)
                              .addRiwayat({
                            "tanggal": formattedTime,
                            "lokasi": "Halte A Bukit",
                            "nomorKursi": selectedSeat.toString(),
                            "idTransaksi": transactionId,
                          });

                          // Tambahkan notifikasi baru ke daftar
                          Provider.of<UserProvider>(context, listen: false)
                              .addNotification({
                            "title": "Halte A Bukit",
                            "status": "Pemesanan Berhasil",
                            "time": formattedTime,
                          });

                          // Navigasi kembali ke halaman Home
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Kembali",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value, {Color? statusColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: statusColor ?? Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
