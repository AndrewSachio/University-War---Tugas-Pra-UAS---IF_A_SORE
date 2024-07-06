import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/staff/Edit_Password.dart';
import 'package:kopicow_application/staff/Edit_Profile.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Center(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      './profile.jpeg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  _profilField(context),
                  SizedBox(height: 2),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(450, 70),
                          backgroundColor: Color(0xffb895f46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPassword(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(450, 70),
                          backgroundColor: Color(0xffb895f46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profilField(BuildContext context) {
    final loggedInUser = Provider.of<AccountProvider>(context).loggedInUser;
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        bottom: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xffb29377),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Detail Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'ID Staff',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  loggedInUser?.id ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  loggedInUser?.name ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'UserName',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  loggedInUser?.username ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Position',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  loggedInUser?.position ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  loggedInUser?.email ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.white,
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
