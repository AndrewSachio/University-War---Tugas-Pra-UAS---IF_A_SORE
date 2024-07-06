import 'package:flutter/material.dart';
import 'package:kopicow_application/admin/Add_Assets.dart';
import 'package:kopicow_application/components/Assets_Provider.dart';
import 'package:kopicow_application/components/Assets_Detail.dart';
import 'package:kopicow_application/components/Category_Provider.dart';
import 'package:provider/provider.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Assets',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAssets(),
            ),
          );
        },
        backgroundColor: Colors.brown,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: const CircleBorder(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: categoryProvider.getCategoryNames().map((categoryName) {
                return ChoiceChip(
                  label: Text(categoryName),
                  selected: selectedCategories.contains(categoryName),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(categoryName);
                      } else {
                        selectedCategories.remove(categoryName);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: assetsProvider.assets.length,
              itemBuilder: (context, index) {
                final asset = assetsProvider.assets[index];

                if (selectedCategories.isNotEmpty &&
                    !selectedCategories.contains(asset.category)) {
                  return Container();
                }

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AssetDetailsModal(asset: asset);
                      },
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(asset.assetName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Asset Code: ${asset.assetCode}'),
                          Text('Amount: ${asset.amount}'),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'remove') {
                            assetsProvider.deleteAssets(index);
                          } else if (value == 'edit') {
                            // Navigate to edit screen or dialog
                          } else if (value == 'add_unit') {
                            _showUpdateAmountDialog(
                                context, assetsProvider, index);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'remove',
                            child: const Text('Remove'),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: const Text('Edit Assets'),
                          ),
                          PopupMenuItem(
                            value: 'add_unit',
                            child: const Text('Update Amount'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateAmountDialog(
      BuildContext context, AssetsProvider assetsProvider, int index) {
    final asset = assetsProvider.assets[index];
    final amountController = TextEditingController(text: asset.amount);
    final unitPriceController = TextEditingController(text: asset.unitPrice);
    final totalPriceController = TextEditingController(text: asset.totalPrice);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Amount and Total Price'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: unitPriceController,
                  decoration: InputDecoration(labelText: 'Unit Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: totalPriceController,
                  decoration: InputDecoration(labelText: 'Total Price'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newAmount = amountController.text;
                final newUnitPrice = unitPriceController.text;
                final newTotalPrice = totalPriceController.text;

                setState(() {
                  assetsProvider.updateAmount(
                    index,
                    amount: newAmount,
                    unitPrice: newUnitPrice,
                    totalPrice: newTotalPrice,
                  );
                });

                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
