import 'package:flutter/material.dart';
import 'package:kopicow_application/admin/Home_Page.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String LoginText = "Login";

  bool? isUsernameEmpty;
  bool? isPasswordEmpty;

  @override
  void initState() {
    username.text = 'Admin';
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffe5d4ba),
        child: Container(
          color: Color(0xffe5d4ba),
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
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xffb29377),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffd3bfa7),
            ),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('Username'),
                errorText:
                    isUsernameEmpty == true ? "Username Required!" : null,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffd3bfa7),
            ),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                label: Text('Password'),
                errorText:
                    isPasswordEmpty == true ? "Password Required!" : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 85, right: 85),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (username.text.isEmpty) {
                          setState(() {
                            isUsernameEmpty = true;
                          });
                        }
                        if (password.text.isEmpty) {
                          setState(() {
                            isPasswordEmpty = true;
                          });
                        } else {
                          setState(() {
                            isUsernameEmpty = false;
                            isPasswordEmpty = false;
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeAdmin()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: Color(0xFF895F46)),
                      child: Text(
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
        Image.asset('./logo.png', width: 350),
      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color(0xFF895F46),
              title: Text("Feature Not Available",
                  style: TextStyle(color: Colors.white)),
              content: Text(
                  "For the admin page, this feature is not available.",
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  child: Text("OK", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        "Forgot password?",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account yet? "),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color(0xFF895F46),
                  title: Text("Feature Not Available",
                      style: TextStyle(color: Colors.white)),
                  content: Text(
                      "For the admin page, this feature is not available.",
                      style: TextStyle(color: Colors.white)),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            "Register",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
