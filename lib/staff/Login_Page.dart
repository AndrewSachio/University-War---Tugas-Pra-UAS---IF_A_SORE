import 'package:flutter/material.dart';
import 'package:kopicow_application/staff/Verify_Page.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/staff/Register_Page.dart';
import 'package:kopicow_application/staff/Home_Page.dart';

class LoginStaff extends StatefulWidget {
  const LoginStaff({Key? key}) : super(key: key);

  @override
  State<LoginStaff> createState() => _LoginStaffState();
}

class _LoginStaffState extends State<LoginStaff> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isUsernameEmpty = false;
  bool _isPasswordEmpty = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5d4ba),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffb29377),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffd3bfa7),
            ),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelText: 'Username',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffd3bfa7),
            ),
            child: TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isUsernameEmpty = _usernameController.text.isEmpty;
                          _isPasswordEmpty = _passwordController.text.isEmpty;
                        });

                        if (!_isUsernameEmpty && !_isPasswordEmpty) {
                          bool isValidUser = accountProvider.accounts.any(
                            (account) =>
                                account.username == _usernameController.text &&
                                account.passwordAcc == _passwordController.text,
                          );

                          if (isValidUser) {
                            Account? user = accountProvider.accounts.firstWhere(
                              (account) =>
                                  account.username ==
                                      _usernameController.text &&
                                  account.passwordAcc ==
                                      _passwordController.text,
                            );
                            accountProvider.setLoggedInUser(user);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeStaff(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.brown,
                                  title: Text(
                                    'Invalid Credentials',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    'Please enter valid username and password.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xFF895F46),
                      ),
                      child: const Text(
                        'LOGIN',
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

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Image.asset('./logo.png', width: 250),
      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VerifyPage()),
        );
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account yet? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: const Text(
            "Register",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
