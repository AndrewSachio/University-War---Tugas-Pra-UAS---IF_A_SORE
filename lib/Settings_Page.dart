import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/components/DarkMode_Provider.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/staff/Edit_Password.dart';
import 'package:kopicow_application/staff/Edit_Profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationsActive = false;
  late AccountProvider accountProvider;

  @override
  void initState() {
    super.initState();
    accountProvider = Provider.of<AccountProvider>(context, listen: false);
  }

  void _showNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'I will ring if there is a notification for you.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            'Choose Language',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title:
                    Text('Indonesian', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToEditProfile(BuildContext context) {
    if (accountProvider.loggedInUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditProfile(),
        ),
      );
    } else {
      _showLoginRequiredPopup(context);
    }
  }

  void _navigateToEditPassword(BuildContext context) {
    if (accountProvider.loggedInUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditPassword(),
        ),
      );
    } else {
      _showLoginRequiredPopup(context);
    }
  }

  void _showLoginRequiredPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Text(
            'Login Required',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'You need to login as a staff to access this feature.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DarkmodeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffb29377),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffb29377),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Account',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffb29377),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: const Text('Edit Profile',
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.white),
                    onTap: () {
                      _navigateToEditProfile(context);
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.white),
                    title: const Text('Change Password',
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.white),
                    onTap: () {
                      _navigateToEditPassword(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffb29377),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'General',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffb29377),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.dark_mode, color: Colors.white),
                    title: const Text('Dark Mode',
                        style: TextStyle(color: Colors.white)),
                    trailing: Switch(
                      value: prov.enableDarkMode,
                      activeColor: Colors.green[300],
                      onChanged: (val) {
                        prov.setbrightness = val;
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.white),
                    title: const Text('Notification',
                        style: TextStyle(color: Colors.white)),
                    trailing: Switch(
                      value: isNotificationsActive,
                      activeColor: Colors.green[300],
                      onChanged: (value) {
                        setState(() {
                          isNotificationsActive = value;
                          if (value) {
                            _showNotification(context);
                          }
                        });
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.language, color: Colors.white),
                    title: const Text('Language',
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.white),
                    onTap: () {
                      _showLanguageDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
