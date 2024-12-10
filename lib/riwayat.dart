import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nota.dart';
import 'userprovider.dart';

class riwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses data riwayat dari UserProvider
    final riwayatList = Provider.of<UserProvider>(context).riwayatList;

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
            padding: const EdgeInsets.only(top: 60),
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
                          Navigator.pop(context);
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
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.history,
                              color: Colors.white,
                              size: 39,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Riwayat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100), // Space after title
                // Body content
                Expanded(
                  child: riwayatList.isEmpty
                      ? const Center(
                          child: Text(
                            "Belum ada riwayat perjalanan.",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: riwayatList.length,
                          itemBuilder: (context, index) {
                            final item = riwayatList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Gambar bus
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue.shade100,
                                      ),
                                      child: Image.asset(
                                        'assets/mobil.png', // Ganti dengan path gambar Anda
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Informasi perjalanan
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["lokasi"]!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            "Pemesanan Selesai",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        final item = riwayatList[
                                            index]; // Ambil item dari riwayat
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Nota(
                                              formattedTime: item[
                                                  "tanggal"]!, // Data waktu pemesanan
                                              transactionID: item[
                                                  "idTransaksi"]!, // Data ID transaksi
                                              selectedSeat: int.parse(item[
                                                  "nomorKursi"]!), // Data nomor kursi
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                            0xFF143C5E), // Warna tombol
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text(
                                        "Bukti Pemesanan",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
