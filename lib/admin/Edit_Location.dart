import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Location_Provider.dart';
import 'package:provider/provider.dart';

class EditLocation extends StatefulWidget {
  final int index;
  final String initialLoca;
  final String descriptionLoca;

  EditLocation({
    required this.index,
    required this.initialLoca,
    required this.descriptionLoca,
  });

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.initialLoca);
    _descriptionController =
        TextEditingController(text: widget.descriptionLoca);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textLocation = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Location',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Location Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                controller: _locationController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Location name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter the Location',
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
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter the Description',
                  filled: true,
                  fillColor: const Color(0xffD3BFA7),
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
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
                    if (_formKey.currentState!.validate()) {
                      textLocation.updateLocation(
                        widget.index,
                        _locationController.text,
                        _descriptionController.text,
                      );
                      Navigator.pop(context);
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
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
