import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopicow_application/components/Assets_Provider.dart';
import 'package:kopicow_application/components/Category_Provider.dart';
import 'package:kopicow_application/components/Distributor_Provider.dart';
import 'package:provider/provider.dart';

class AddAssets extends StatefulWidget {
  const AddAssets({super.key});

  @override
  State<AddAssets> createState() => _AddAssetsState();
}

class _AddAssetsState extends State<AddAssets> {
  TextEditingController _assetNameController = TextEditingController();
  TextEditingController _assetCodeController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _manufacturerController = TextEditingController();
  TextEditingController _productionCodeController = TextEditingController();
  TextEditingController _productionYearController = TextEditingController();
  TextEditingController _dateOfPurchaseController = TextEditingController();
  TextEditingController _invoiceController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _unitPriceController = TextEditingController();
  TextEditingController _totalPriceController = TextEditingController();
  TextEditingController _economicAgeController = TextEditingController();
  TextEditingController _shrinkageController = TextEditingController();
  ItemCategory? _selectedCategory;
  ItemDistributor? _selectedDistributor;

  void _resetForm() {
    _assetNameController.text = '';
    _assetCodeController.text = '';
    _brandController.text = '';
    _typeController.text = '';
    _manufacturerController.text = '';
    _productionCodeController.text = '';
    _productionYearController.text = '';
    _dateOfPurchaseController.text = '';
    _invoiceController.text = '';
    _amountController.text = '';
    _unitPriceController.text = '';
    _totalPriceController.text = '';
    _economicAgeController.text = '';
    _shrinkageController.text = '';
    _selectedCategory = null;
    _selectedDistributor = null;
  }

  @override
  Widget build(BuildContext context) {
    final textCategory = Provider.of<CategoryProvider>(context);
    final textDistributor = Provider.of<DistributorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Assets',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffb29377),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Umum',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 160, 131, 106),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildTextField('Asset Name', _assetNameController),
                    SizedBox(height: 10),
                    _buildTextField('Asset Code', _assetCodeController),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton<ItemCategory>(
                          hint: Text(
                            'Select a Category',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: _selectedCategory,
                          items: textCategory.Category.map((ItemCategory text) {
                            return DropdownMenuItem<ItemCategory>(
                              value: text,
                              child: Text(text.nameCate),
                            );
                          }).toList(),
                          onChanged: (ItemCategory? newValue) {
                            setState(() {
                              _selectedCategory = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Assets Detail',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 160, 131, 106),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildTextField('Brand', _brandController),
                    SizedBox(height: 10),
                    _buildTextField('Type', _typeController),
                    SizedBox(height: 10),
                    _buildTextField('Manufacturer', _manufacturerController),
                    SizedBox(height: 10),
                    _buildTextField(
                        'Production Code', _productionCodeController),
                    SizedBox(height: 10),
                    _buildYearField(
                        'Production Year', _productionYearController),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Purchasing',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 160, 131, 106),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildDateField(
                        'Date of Purchase', _dateOfPurchaseController),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Distributor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        DropdownButton<ItemDistributor>(
                          hint: Text(
                            'Select a Distributor',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: _selectedDistributor,
                          items: textDistributor.Distributor.map(
                              (ItemDistributor text) {
                            return DropdownMenuItem<ItemDistributor>(
                              value: text,
                              child: Text(text.nameDist),
                            );
                          }).toList(),
                          onChanged: (ItemDistributor? newValue) {
                            setState(() {
                              _selectedDistributor = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField('No Invoice', _invoiceController),
                    SizedBox(height: 10),
                    _buildAddNumberField('Amount', _amountController),
                    SizedBox(height: 10),
                    _buildNumberTextField(
                        'Unit Price (Rp.)', _unitPriceController),
                    SizedBox(height: 10),
                    _buildNumberTextField(
                        'Total Price (Rp.)', _totalPriceController),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Depreciation of Assets',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 160, 131, 106),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildYearField(
                        'Economic Age (Years)', _economicAgeController),
                    SizedBox(height: 10),
                    _buildNumberTextField(
                        'Shrinkage (Rp.)', _shrinkageController),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _resetForm();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.brown[200],
                  ),
                  child: const Text(
                    'RESET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<AssetsProvider>(context, listen: false)
                        .addAssets(
                      _assetNameController.text,
                      _assetCodeController.text,
                      _selectedCategory!.nameCate,
                      _brandController.text,
                      _typeController.text,
                      _manufacturerController.text,
                      _productionCodeController.text,
                      _productionYearController.text,
                      _dateOfPurchaseController.text,
                      _invoiceController.text,
                      _amountController.text,
                      _unitPriceController.text,
                      _totalPriceController.text,
                      _economicAgeController.text,
                      _shrinkageController.text,
                    );
                    int amount = int.tryParse(_amountController.text) ?? 0;
                    textCategory.updateUnitCount(
                        _selectedCategory!.nameCate, amount);
                    textDistributor.updateUnitCount(
                        _selectedDistributor!.nameDist, amount);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 87, vertical: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.brown[400],
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter the $labelText',
            filled: true,
            fillColor: const Color(0xffD3BFA7),
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberTextField(
      String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: 'Enter the $labelText',
            filled: true,
            fillColor: const Color(0xffD3BFA7),
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddNumberField(
      String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 50),
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                int currentValue = int.tryParse(controller.text) ?? 0;
                if (currentValue > 0) {
                  setState(() {
                    currentValue--;
                    controller.text = currentValue.toString();
                  });
                }
              },
            ),
            Container(
              width: 50,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffD3BFA7),
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                int currentValue = int.tryParse(controller.text) ?? 0;
                setState(() {
                  currentValue++;
                  controller.text = currentValue.toString();
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Select the $labelText',
            filled: true,
            fillColor: const Color(0xffD3BFA7),
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                controller.text = "${pickedDate.toLocal()}".split(' ')[0];
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildYearField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Select the $labelText',
            filled: true,
            fillColor: const Color(0xffD3BFA7),
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
          ),
          onTap: () async {
            int? pickedYear = await showDialog<int>(
              context: context,
              builder: (BuildContext context) {
                int selectedYear = DateTime.now().year;
                return AlertDialog(
                  title: Text("Select Year"),
                  content: Container(
                    width: double.minPositive,
                    child: YearPicker(
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      initialDate: DateTime.now(),
                      selectedDate: DateTime(selectedYear),
                      onChanged: (DateTime dateTime) {
                        Navigator.pop(context, dateTime.year);
                      },
                    ),
                  ),
                );
              },
            );
            if (pickedYear != null) {
              setState(() {
                controller.text = pickedYear.toString();
              });
            }
          },
        ),
      ],
    );
  }
}
