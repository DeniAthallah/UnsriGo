import 'package:flutter/material.dart';
import 'package:flutter_application_unsrigo/HomePage.dart';

class Selesai extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment
                    .center, // Memastikan elemen berada di tengah secara vertikal
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Memastikan elemen berada di tengah secara horizontal
                children: [
                  SizedBox(height: 150), // Jarak dari atas
                  // Gambar Berhasil
                  Center(
                    child: Image.asset(
                      'assets/Berhasil.png',
                      width: 100, // Sesuaikan ukuran
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Text "Pemesanan Berhasil!"
                  Text(
                    "Pemesanan Berhasil!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Tombol "Kembali"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      // Kembali ke halaman sebelumnya
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
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
