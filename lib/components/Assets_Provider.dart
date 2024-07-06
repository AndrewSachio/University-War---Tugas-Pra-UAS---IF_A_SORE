import 'package:flutter/material.dart';

class ItemAssets {
  String assetName;
  String assetCode;
  String category;
  String brand;
  String type;
  String manufacturer;
  String productionCode;
  String productionYear;
  String datePurchase;
  String invoice;
  String amount;
  String unitPrice;
  String totalPrice;
  String economicAge;
  String shrinkage;

  ItemAssets(
      {required this.assetName,
      required this.assetCode,
      required this.category,
      required this.brand,
      required this.type,
      required this.manufacturer,
      required this.productionCode,
      required this.productionYear,
      required this.datePurchase,
      required this.invoice,
      required this.amount,
      required this.unitPrice,
      required this.totalPrice,
      required this.economicAge,
      required this.shrinkage});
}

class AssetsProvider extends ChangeNotifier {
  List<ItemAssets> _assets = [];

  List<ItemAssets> get assets => _assets;

  void addAssets(
    String assetName,
    String assetCode,
    String category,
    String brand,
    String type,
    String manufacturer,
    String productionCode,
    String productionYear,
    String datePurchase,
    String invoice,
    String amount,
    String unitPrice,
    String totalPrice,
    String economicAge,
    String shrinkage,
  ) {
    _assets.add(ItemAssets(
      assetName: assetName,
      assetCode: assetCode,
      category: category,
      brand: brand,
      type: type,
      manufacturer: manufacturer,
      productionCode: productionCode,
      productionYear: productionYear,
      datePurchase: datePurchase,
      invoice: invoice,
      amount: amount,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
      economicAge: economicAge,
      shrinkage: shrinkage,
    ));
    notifyListeners();
  }

  void updateAssets(
    int index, {
    required String assetName,
    required String assetCode,
    required String category,
    required String brand,
    required String type,
    required String manufacturer,
    required String productionCode,
    required String productionYear,
    required String datePurchase,
    required String invoice,
    required String amount,
    required String unitPrice,
    required String totalPrice,
    required String economicAge,
    required String shrinkage,
  }) {
    if (index >= 0 && index < _assets.length) {
      _assets[index] = ItemAssets(
        assetName: assetName,
        assetCode: assetCode,
        category: category,
        brand: brand,
        type: type,
        manufacturer: manufacturer,
        productionCode: productionCode,
        productionYear: productionYear,
        datePurchase: datePurchase,
        invoice: invoice,
        amount: amount,
        unitPrice: unitPrice,
        totalPrice: totalPrice,
        economicAge: economicAge,
        shrinkage: shrinkage,
      );
      notifyListeners();
    }
  }

  void deleteAssets(int index) {
    if (index >= 0 && index < _assets.length) {
      _assets.removeAt(index);
      notifyListeners();
    }
  }

  void updateAmount(int index,
      {String? amount, String? unitPrice, String? totalPrice}) {
    if (index >= 0 && index < _assets.length) {
      _assets[index] = ItemAssets(
        assetName: _assets[index].assetName,
        assetCode: _assets[index].assetCode,
        category: _assets[index].category,
        brand: _assets[index].brand,
        type: _assets[index].type,
        manufacturer: _assets[index].manufacturer,
        productionCode: _assets[index].productionCode,
        productionYear: _assets[index].productionYear,
        datePurchase: _assets[index].datePurchase,
        invoice: _assets[index].invoice,
        amount: amount ?? _assets[index].amount,
        unitPrice: unitPrice ?? _assets[index].unitPrice,
        totalPrice: totalPrice ?? _assets[index].totalPrice,
        economicAge: _assets[index].economicAge,
        shrinkage: _assets[index].shrinkage,
      );
      notifyListeners();
    }
  }
}
