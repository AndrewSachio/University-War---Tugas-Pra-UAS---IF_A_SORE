import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Distributor_Provider.dart';
import 'package:provider/provider.dart';

class DistributorPage extends StatelessWidget {
  const DistributorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textDistributor = Provider.of<DistributorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Distributor',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: textDistributor.Distributor.length,
        itemBuilder: (context, index) {
          var distributor = textDistributor.Distributor[index];
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
                        distributor.nameDist,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            distributor.address,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                distributor.email,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                distributor.numberPhone,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            distributor.description,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      leading: const Text(
                        '100 unit',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text('Show List Assets'),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
