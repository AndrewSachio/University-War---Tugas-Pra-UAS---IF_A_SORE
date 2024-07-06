import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/staff/OTP_Page.dart';
import 'package:kopicow_application/staff/Login_Page.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 212, 186),
      body: Container(
        color: const Color(0xffe5d4ba),
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            _header(),
            _inputField(context, emailController),
            _tryAnotherWay(context),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      BuildContext context, TextEditingController emailController) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffb29377),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffd3bfa7),
          ),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 85, right: 85),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      final provider =
                          Provider.of<AccountProvider>(context, listen: false);
                      bool emailExists = provider.accounts.any(
                          (account) => account.email == emailController.text);
                      if (emailExists) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtpPage(email: emailController.text)),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.brown,
                              title: const Text(
                                'Invalid Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              content: const Text(
                                'No account found with this email.',
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xFF895F46),
                    ),
                    child: const Text(
                      'SEND',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('./forgot1.png', width: 200),
        const SizedBox(height: 25),
        const Text(
          'Please Enter Your Email Address To \nReceive a Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Widget _tryAnotherWay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginStaff()));
          },
          child: const Text(
            "Try Another Way",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
