import 'package:flutter/material.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          backgroundColor: const Color(0xffb29377),
        ),
        body: Center(
      child: Text('Coming Soon'),
    ));
  }
}
