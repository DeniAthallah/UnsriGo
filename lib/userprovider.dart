import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = 'default@example.com'; // Set email default
  List<Map<String, dynamic>> _riwayatList = [];
  List<Map<String, dynamic>> _notifications = []; // Menyimpan daftar notifikasi

  String get email => _email;
  List<Map<String, dynamic>> get riwayatList => _riwayatList;
  List<Map<String, dynamic>> get notifications => _notifications;

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void addRiwayat(Map<String, dynamic> riwayat) {
    _riwayatList.insert(0, riwayat); // Menambahkan riwayat ke index pertama
    notifyListeners();
  }

  void addNotification(Map<String, dynamic> notificationData) {
    _notifications.insert(0, notificationData); // Menambahkan notifikasi di urutan pertama
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear(); // Menghapus semua notifikasi
    notifyListeners();
  }
}
