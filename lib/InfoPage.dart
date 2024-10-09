import 'package:flutter/material.dart';
import 'package:flutter_application_unsrigo/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Top Image behind the UG logo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/top2.png', // Path to the image (make sure it's added in pubspec.yaml)
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200, // Adjust the height as per your need
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),

                  Center(
                      child: Image.asset(
                        'assets/ug.png', // UG logo path
                        fit: BoxFit
                            .contain, // Ensures the logo scales while maintaining aspect ratio
                        width: MediaQuery.of(context).size.width *
                            200, // 70% of screen width
                      ),
                    ),
                    
                  Text(
                    "WELCOME",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F2828)),
                  ),
                  Text(
                    "Hello there! , Login to Continue",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F2828)),
                  ),

                  SizedBox(height: 10),

                  // Container with yellow background for login options and buttons
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFFE088), Color(0xFFFFC727)],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Masuk Menggunakan:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20, height: 15),
                          // Social Login Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Google Login Button
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/googlee.png',
                                  height: 24,
                                  width: 24,
                                ),
                                label: const Text('Google'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Facebook Login Button
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/fb.png',
                                  height: 24,
                                  width: 24,
                                ),
                                label: const Text('Facebook'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: const Text(
                              'Atau',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Email Input
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Password Input
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.visibility),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          // Buttons Row (Keluar, Lanjut)
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 15,
                                    backgroundColor: Color(0xFF143C5E),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(55),
                                    ),
                                  ),
                                  child: Text(
                                    'Keluar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 15,
                                    backgroundColor: Color(0xFF143C5E),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(55),
                                    ),
                                  ),
                                  child: Text(
                                    'Lanjut',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
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
            ),
          ),
        ],
      ),
    );
  }
}
