import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Distributor_Provider.dart';
import 'package:provider/provider.dart';

class EditDistributor extends StatefulWidget {
  final int index;
  final String nameDist;
  final String address;
  final String phoneNumber;
  final String email;
  final String description;

  EditDistributor({
    required this.index,
    required this.nameDist,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.description,
  });

  @override
  State<EditDistributor> createState() => _EditDistributorState();
}

class _EditDistributorState extends State<EditDistributor> {
  final TextEditingController distributorController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? distributorError;
  String? emailError;
  String? phoneError;

  void resetFields() {
    distributorController.clear();
    addressController.clear();
    phonenumberController.clear();
    emailController.clear();
    descriptionController.clear();
    setState(() {
      distributorError = null;
      emailError = null;
      phoneError = null;
    });
  }

  bool validateFields() {
    bool isValid = true;
    setState(() {
      distributorError = null;
      emailError = null;
      phoneError = null;
    });

    if (distributorController.text.isEmpty) {
      setState(() {
        distributorError = 'Distributor name is required';
      });
      isValid = false;
    }

    if (emailController.text.isNotEmpty &&
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      setState(() {
        emailError = 'Invalid email format';
      });
      isValid = false;
    }

    if (phonenumberController.text.isNotEmpty &&
        !RegExp(r'^\d+$').hasMatch(phonenumberController.text)) {
      setState(() {
        phoneError = 'Phone number must contain only digits';
      });
      isValid = false;
    }

    return isValid;
  }

  @override
  void initState() {
    super.initState();
    distributorController.text = widget.nameDist;
    addressController.text = widget.address;
    phonenumberController.text = widget.phoneNumber;
    emailController.text = widget.email;
    descriptionController.text = widget.description;
  }

  @override
  void dispose() {
    distributorController.dispose();
    addressController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textDistributor = Provider.of<DistributorProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Distributor',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.brown,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Store Name / Distributor Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: distributorController,
                  decoration: InputDecoration(
                    hintText: 'Enter the Distributor',
                    filled: true,
                    fillColor: const Color(0xffD3BFA7),
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    errorText: distributorError,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter the Address',
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
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: phonenumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter the Phone Number',
                    filled: true,
                    fillColor: const Color(0xffD3BFA7),
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    errorText: phoneError,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter the Email',
                    filled: true,
                    fillColor: const Color(0xffD3BFA7),
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    errorText: emailError,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Enter the Description',
                    filled: true,
                    fillColor: const Color(0xffD3BFA7),
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (validateFields()) {
                        textDistributor.updateDistributor(
                          widget.index,
                          distributorController.text,
                          addressController.text,
                          phonenumberController.text,
                          emailController.text,
                          descriptionController.text,
                        );
                        Navigator.of(context).pop();
                      }
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
                      'SAVE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
