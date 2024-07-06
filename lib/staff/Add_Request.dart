import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Request_Provider.dart';
import 'package:provider/provider.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({Key? key}) : super(key: key);

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController departmentNameController = TextEditingController();
  TextEditingController responsiblePersonController = TextEditingController();

  bool isDepartmentSelected = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void resetFields() {
    itemNameController.clear();
    quantityController.clear();
    reasonController.clear();
    departmentNameController.clear();
    responsiblePersonController.clear();
    setState(() {
      isDepartmentSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Request',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffb29377),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Item Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                controller: itemNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Item name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter item name',
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
              SizedBox(height: 20),
              Text(
                'Quantity Needed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Quantity is required';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number for quantity';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter quantity',
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
              SizedBox(height: 20),
              Text(
                'Reason',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                controller: reasonController,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Reason is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter reason',
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
              SizedBox(height: 20),
              Text(
                'Select Usage Destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: false,
                    groupValue: isDepartmentSelected,
                    onChanged: (value) {
                      setState(() {
                        isDepartmentSelected = value as bool;
                      });
                    },
                  ),
                  Text('Personal'),
                  Radio(
                    value: true,
                    groupValue: isDepartmentSelected,
                    onChanged: (value) {
                      setState(() {
                        isDepartmentSelected = value as bool;
                      });
                    },
                  ),
                  Text('Department'),
                ],
              ),
              SizedBox(height: 20),
              if (isDepartmentSelected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    TextFormField(
                      controller: departmentNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter department name',
                        filled: true,
                        fillColor: const Color(0xffD3BFA7),
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Responsible Person',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    TextFormField(
                      controller: responsiblePersonController,
                      decoration: InputDecoration(
                        hintText: 'Enter responsible person',
                        filled: true,
                        fillColor: const Color(0xffD3BFA7),
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetFields();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20),
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
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        isDepartmentSelected ? 'Department' : 'Personal';
                        String departmentName = isDepartmentSelected
                            ? departmentNameController.text
                            : '';
                        String responsiblePerson = isDepartmentSelected
                            ? responsiblePersonController.text
                            : '';

                        Provider.of<RequestProvider>(context, listen: false)
                            .addRequest(
                          itemName: itemNameController.text,
                          quantity: int.parse(quantityController.text),
                          reason: reasonController.text,
                          isDepartmentRequest: isDepartmentSelected,
                          departmentName: departmentName,
                          responsiblePerson: responsiblePerson,
                        );

                        resetFields();
                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Your request is under review'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20),
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
      ),
    );
  }
}
