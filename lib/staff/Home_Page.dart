import 'package:flutter/material.dart';
import 'package:kopicow_application/Settings_Page.dart';
import 'package:kopicow_application/admin/Add_Assets.dart';
import 'package:kopicow_application/staff/Barcode_Page.dart';
import 'package:kopicow_application/staff/Category_Page.dart';
import 'package:kopicow_application/staff/Distributor_Page.dart';
import 'package:kopicow_application/staff/Add_Request.dart';
import 'package:kopicow_application/staff/Location_Page.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/staff/Profile_Page.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/Landing_Page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeStaff extends StatefulWidget {
  const HomeStaff({super.key});

  @override
  State<HomeStaff> createState() => _HomeStaffState();
}

class _HomeStaffState extends State<HomeStaff> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeStaffContent(),
    ProfilePage(),
  ];

  final List<String> _titles = [
    'Kopicow',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final loggedInUser = accountProvider.loggedInUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex],
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xffb29377),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: buildDrawer(context, loggedInUser, accountProvider),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BarcodePage()),
          );
        },
        child: Icon(Icons.qr_code_scanner, color: Colors.white),
        shape: const CircleBorder(),
        backgroundColor: Color(0xffb29377),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Drawer buildDrawer(BuildContext context, dynamic loggedInUser,
      AccountProvider accountProvider) {
    return Drawer(
      child: Column(
        children: [
          if (loggedInUser != null) buildDrawerHeader(loggedInUser),
          Expanded(child: buildDrawerList(context)),
          buildDrawerFooter(context, accountProvider),
        ],
      ),
    );
  }

  DrawerHeader buildDrawerHeader(dynamic loggedInUser) {
    return DrawerHeader(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Color(0xffb29377)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/profile.jpeg')),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(loggedInUser.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('${loggedInUser.id}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView buildDrawerList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Divider(),
        buildDrawerItem(context, Icons.person, 'Profile', () {
          Navigator.pop(context);
          _onItemTapped(1);
        }),
        buildDrawerItem(context, Icons.notifications, 'Notification', () {}),
        buildDrawerItem(context, Icons.archive_sharp, 'Assets List', () {}),
      ],
    );
  }

  Column buildDrawerFooter(
      BuildContext context, AccountProvider accountProvider) {
    return Column(
      children: [
        Divider(),
        buildDrawerItem(context, Icons.settings, 'Settings', () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        }),
        buildDrawerItem(context, Icons.logout_rounded, 'Logout', () {
          accountProvider.setLoggedInUser(null);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        }, iconColor: Colors.red, textColor: Colors.red),
      ],
    );
  }

  ListTile buildDrawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap,
      {Color iconColor = Colors.black, Color textColor = Colors.black}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
    );
  }

  BottomAppBar buildBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Color(0xffb29377),
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildBottomNavigationBarItem(Icons.home, 'Home', 0),
            SizedBox(width: 200),
            buildBottomNavigationBarItem(Icons.person, 'Profile', 1),
          ],
        ),
      ),
    );
  }

  MaterialButton buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              color: _selectedIndex == index
                  ? Color.fromARGB(255, 87, 179, 253)
                  : Colors.white),
          Text(label,
              style: TextStyle(
                  color: _selectedIndex == index
                      ? Color.fromARGB(255, 87, 179, 253)
                      : Colors.white)),
        ],
      ),
    );
  }
}

class HomeStaffContent extends StatelessWidget {
  const HomeStaffContent({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final loggedInUser = accountProvider.loggedInUser;

    return Scaffold(
      body: loggedInUser != null
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Welcome, ${loggedInUser.name}!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  carouselIklan(context),
                  Menu(),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget carouselIklan(BuildContext context) {
    final List<String> imgList = [
      './pic1.jpeg',
      './pic2.jpg',
      './pic3.jpg',
      './pic4.jpeg',
      './pic5.jpeg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000)),
              ))
          .toList(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.list_alt_sharp, 'label': 'Category', 'page': CategoryPage()},
    {'icon': Icons.add_location, 'label': 'Location', 'page': LocationPage()},
    {
      'icon': Icons.store_mall_directory,
      'label': 'Distributor',
      'page': DistributorPage()
    },
    {'icon': Icons.web_asset_rounded, 'label': 'Assets', 'page': AddAssets()},
    {
      'icon': Icons.request_page,
      'label': 'Request',
      'page': AddRequest()
    },
    {'icon': Icons.apartment_rounded, 'label': 'Outlet', 'page': AddAssets()},
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems = menuItems.where((item) {
      return item['label'].toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0, // Reduced spacing
            mainAxisSpacing: 2.0, // Reduced spacing
          ),
          itemCount: filteredItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = filteredItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffb29377),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Icon(item['icon'], color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(item['label'], style: TextStyle(fontSize: 14.0)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
