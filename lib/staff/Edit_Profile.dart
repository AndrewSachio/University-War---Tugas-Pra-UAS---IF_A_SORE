import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/components/Account_Provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _selectedPosition;
  List<String> _dropdownItems = ['CEO', 'CTO', 'Manager', 'Marketing', 'Sales'];

  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedPosition = _dropdownItems[0];

    Account? loggedInUser =
        Provider.of<AccountProvider>(context, listen: false).loggedInUser;
    _employeeIdController.text = loggedInUser?.id ?? '';
    _nameController.text = loggedInUser?.name ?? '';
    _usernameController.text = loggedInUser?.username ?? '';
    _emailController.text = loggedInUser?.email ?? '';
    _selectedPosition = loggedInUser?.position ?? _dropdownItems[0];
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileAvatar(),
                  const SizedBox(height: 20),
                  _buildProfileFields(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: const Color.fromARGB(255, 137, 95, 70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileFields() {
    final accountProvider = Provider.of<AccountProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 178, 147, 119),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
              "Employee ID", "Enter your Staff Id", _employeeIdController),
          _buildTextField("Name", "Enter your Name", _nameController),
          _buildDisabledTextField(
              "Username", "Enter your Username", _usernameController),
          DropdownButtonFormField<String>(
            value: _selectedPosition,
            onChanged: (String? newValue) {
              setState(() {
                _selectedPosition = newValue!;
              });
            },
            items: _dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              labelText: 'Position',
            ),
          ),
          _buildEmailTextField(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 238, 52, 39)),
                  ),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      accountProvider.updateLoggedInUser(
                        _employeeIdController.text,
                        _nameController.text,
                        _selectedPosition!,
                        _emailController.text,
                        _usernameController.text,
                      );

                      accountProvider.updateLoggedInUser(
                        _employeeIdController.text,
                        _nameController.text,
                        _selectedPosition!,
                        _emailController.text,
                        _usernameController.text,
                      );

                      showSuccessSnackBar(context);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String label, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 211, 191, 167),
          ),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildDisabledTextField(
      String label, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 211, 191, 167),
          ),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              controller: controller,
              enabled: false,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Email",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 211, 191, 167),
          ),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              controller: _emailController,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "Enter your Email",
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  void showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showFailedSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
