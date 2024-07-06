import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopicow_application/staff/NewPass_Page.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  bool _areFieldsFilled() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void initState() {
    super.initState();
    // Generate OTP code and print it to the terminal
    _generateAndPrintOTP();
  }

  void _generateAndPrintOTP() {
    final otp = List.generate(4, (index) => (index + 1).toString()).join();
    print("Generated OTP: $otp"); // This is where you would send the OTP via email in a real app
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 212, 186),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Verify Your Email',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              './forgot2.png',
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please Enter The 4 Digit Code Sent To',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Your Email',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 178, 147, 119),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => _buildOtpField(context, index),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _areFieldsFilled()
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPassPage(email: widget.email),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xFF895F46),
                    ),
                    child: const Text(
                      'VERIFY',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Resend Code",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      )
    );
  }

  Widget _buildOtpField(BuildContext context, int index) {
    return Container(
      width: 70,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 229, 212, 186),
          border: Border.all(
            color: Color.fromARGB(255, 229, 212, 186),
          ),
        ),
      child: Container(
          alignment: Alignment.center,
        child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: const InputDecoration(
              border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          setState(() {});
        },
      ),
      ),
    );
  }
}
