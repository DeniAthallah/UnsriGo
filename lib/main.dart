import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'userprovider.dart';  
import 'LoginPage.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), 
      ],
      child: MaterialApp(
        title: 'Aplikasi Pemesanan Bus', 
        theme: ThemeData(
          primarySwatch: Colors.blue, 
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginPage(), 
        debugShowCheckedModeBanner: false, 
      ),
    );
  }
}
