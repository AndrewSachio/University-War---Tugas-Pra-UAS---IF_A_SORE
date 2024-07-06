import 'package:flutter/material.dart';

class MaintancePage extends StatefulWidget {
  const MaintancePage({super.key});

  @override
  State<MaintancePage> createState() => _MaintancePageState();
}

class _MaintancePageState extends State<MaintancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 160, 131, 106),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('./maintance.png'),
              const Text(
                'This app is under \n maintance',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('We are preparing to serve you better.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}
