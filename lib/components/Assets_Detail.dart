import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Assets_Provider.dart';

class AssetDetailsModal extends StatelessWidget {
  final ItemAssets asset;

  const AssetDetailsModal({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      asset.assetName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  _buildDivider(),
                  _buildDetailRow('Asset Code', asset.assetCode),
                  _buildDivider(),
                  _buildDetailRow('Category', asset.category),
                  _buildDivider(),
                  _buildDetailRow('Brand', asset.brand),
                  _buildDivider(),
                  _buildDetailRow('Type', asset.type),
                  _buildDivider(),
                  _buildDetailRow('Manufacturer', asset.manufacturer),
                  _buildDivider(),
                  _buildDetailRow('Production Code', asset.productionCode),
                  _buildDivider(),
                  _buildDetailRow('Production Year', asset.productionYear),
                  _buildDivider(),
                  _buildDetailRow('Date of Purchase', asset.datePurchase),
                  _buildDivider(),
                  _buildDetailRow('Invoice', asset.invoice),
                  _buildDivider(),
                  _buildDetailRow('Amount', asset.amount),
                  _buildDivider(),
                  _buildDetailRow('Unit Price', asset.unitPrice),
                  _buildDivider(),
                  _buildDetailRow('Total Price', asset.totalPrice),
                  _buildDivider(),
                  _buildDetailRow('Economic Age', asset.economicAge),
                  _buildDivider(),
                  _buildDetailRow('Shrinkage', asset.shrinkage),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
          Spacer(),
          Text(
            value,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.brown,
      height: 10,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
