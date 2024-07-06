import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Location_Provider.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocation = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Location',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: textLocation.Location.length,
        itemBuilder: (context, index) {
          var Location = textLocation.Location[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 160, 131, 106),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                      title: Text(
                        Location.nameLoca,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        Location.description,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: const Text(
                        '100 unit',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: TextButton(
                          onPressed: () {}, child: Text('Show List Assets'))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
