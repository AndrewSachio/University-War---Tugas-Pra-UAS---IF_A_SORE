import 'package:flutter/material.dart';
import 'package:kopicow_application/Landing_Page.dart';
import 'package:kopicow_application/Maintance_Page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool status = true;
  // jika status true maka akan dialihkan ke landing page
  // jika status false maka akan dialihkan ke mantance page
  @override
  void initState() {
    super.initState();
    _navigateBasedOnStatus();
  }

  void _navigateBasedOnStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      if (status) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MaintancePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 131, 106),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            './logo2.png',
            width: 300,
          ),
          CircularProgressIndicator()
        ],
      )),
    );
  }
}
