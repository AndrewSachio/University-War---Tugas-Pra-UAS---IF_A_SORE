import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/staff/Login_Page.dart';

class NewPassPage extends StatefulWidget {
  final String email;

  const NewPassPage({Key? key, required this.email}) : super(key: key);

  @override
  _NewPassPageState createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 212, 186),
      body: Container(
        color: const Color(0xffe5d4ba),
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Set New Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            _header(),
            _inputField(
              context,
              newPasswordController,
              confirmPasswordController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(BuildContext context, TextEditingController newPasswordController, TextEditingController confirmPasswordController) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffb29377),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPasswordTextField(
            newPasswordController,
            'New Password',
            _newPasswordVisible,
            (value) => _newPasswordVisible = value,
          ),
          const SizedBox(height: 25),
          _buildPasswordTextField(
            confirmPasswordController,
            'Confirm Password',
            _confirmPasswordVisible,
            (value) => _confirmPasswordVisible = value,
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
                        _updatePassword(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xFF895F46),
                      ),
                      child: const Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField(TextEditingController controller, String hintText, bool isVisible, Function(bool) toggleVisibility) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xffd3bfa7),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hintText,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                toggleVisibility(!isVisible);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('./forgot1.png', width: 200),
        const SizedBox(height: 25),
        const Text(
          'Please Enter Your New Password',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  void _updatePassword(BuildContext context) {
    if (newPasswordController.text == confirmPasswordController.text) {
      final provider = Provider.of<AccountProvider>(context, listen: false);
      provider.updatePasswordByEmail(widget.email, newPasswordController.text);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Text(
              'Password Updated',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Your password has been updated successfully.',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginStaff(),
                    ),
                  );
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Text(
              'Password Mismatch',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'The passwords do not match. Please try again.',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
  }
}
