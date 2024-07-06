import 'package:flutter/material.dart';
import 'package:kopicow_application/Loading_Page.dart';
import 'package:kopicow_application/components/Category_Provider.dart';
import 'package:kopicow_application/components/Location_Provider.dart';
import 'package:kopicow_application/components/Account_Provider.dart';
import 'package:kopicow_application/components/Assets_Provider.dart';
import 'package:kopicow_application/components/DarkMode_Provider.dart';
import 'package:kopicow_application/components/Request_Provider.dart';
import 'package:kopicow_application/components/Image_Provider.dart';
import 'package:kopicow_application/components/Distributor_Provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => AssetsProvider()),
        ChangeNotifierProvider(create: (_) => DarkmodeProvider()),
        ChangeNotifierProvider(create: (_) => RequestProvider()),
        ChangeNotifierProvider(create: (_) => ImageProviderclass()),
        ChangeNotifierProvider(create: (_) => DistributorProvider()),
      ],
      child: Consumer<DarkmodeProvider>(
        builder: (context, darkmodeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kopicow Application',
            theme: darkmodeProvider.enableDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: LoadingPage(),
          );
        },
      ),
    );
  }
}
