import 'package:flutter/material.dart';
import 'package:kopicow_application/staff/Login_Page.dart';
import 'package:kopicow_application/admin/Login_Page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5d4ba),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            children: [
              Image.asset('./landing.png', width: 350),
              SizedBox(height: 10),
              Text('Manage Your \n Company Assets',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
              SizedBox(height: 10),
              Text(
                'organize and monitor the \n use of company assets.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginAdmin();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color(0xFF895F46),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Login as Admin',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginStaff();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color(0xFF895F46),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Login as Employee',
                      style: TextStyle(color: Colors.white),
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
}
