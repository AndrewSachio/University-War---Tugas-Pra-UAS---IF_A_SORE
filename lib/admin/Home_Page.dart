import 'package:flutter/material.dart';
import 'package:kopicow_application/Landing_Page.dart';
import 'package:kopicow_application/Settings_Page.dart';
import 'package:kopicow_application/admin/Assets_Page.dart';
import 'package:kopicow_application/admin/Category_Page.dart';
import 'package:kopicow_application/admin/Distributor_Page.dart';
import 'package:kopicow_application/admin/Location_Page.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.list_alt_sharp, 'label': 'Category', 'page': CategoryPage()},
    {'icon': Icons.add_location, 'label': 'Location', 'page': LocationPage()},
    {
      'icon': Icons.store_mall_directory,
      'label': 'Distributor',
      'page': DistributorPage()
    },
    {'icon': Icons.web_asset_rounded, 'label': 'Assets', 'page': AssetsPage()},
    {'icon': Icons.check_box, 'label': 'Persetujuan', 'page': LocationPage()},
    {'icon': Icons.request_page, 'label': 'Request', 'page': DistributorPage()},
  ];

  List<Widget> buildTopMenuItems() {
    List<Map<String, dynamic>> filteredItems = menuItems.where((item) {
      final label = item['label'].toString().toLowerCase();
      return label.contains(_searchText.toLowerCase());
    }).toList();

    int count = filteredItems.length > 3 ? 3 : filteredItems.length;

    return filteredItems.sublist(0, count).map((item) {
      return _buildMenuContainer(
          context, item['icon'], item['label'], item['page']);
    }).toList();
  }

  List<Widget> buildBottomMenuItems() {
    List<Map<String, dynamic>> filteredItems = menuItems.where((item) {
      final label = item['label'].toString().toLowerCase();
      return label.contains(_searchText.toLowerCase());
    }).toList();

    int start = filteredItems.length > 3 ? 3 : filteredItems.length;
    int count = filteredItems.length > 6 ? 6 : filteredItems.length;

    if (start < count) {
      return filteredItems.sublist(start, count).map((item) {
        return _buildMenuContainer(
            context, item['icon'], item['label'], item['page']);
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Kopicow',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(color: Colors.brown),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.jpeg'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ADMIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '221111888',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notification'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.archive_sharp),
                      title: const Text('Assets List'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingPage()));
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
            child: Container(
              height: screenHeight / 3 + kToolbarHeight + 50,
              color: Color(0xffb29377),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight / 3 + kToolbarHeight + 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buildTopMenuItems(),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buildBottomMenuItems(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuContainer(
      BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30.0, color: Colors.brown),
            SizedBox(height: 5.0),
            Text(label, style: TextStyle(color: Colors.brown)),
          ],
        ),
      ),
    );
  }
}
