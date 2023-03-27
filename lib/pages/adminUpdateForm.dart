import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/pages/admin.dart';
import 'package:flutter/material.dart';

class UserUpdateForm extends StatefulWidget {
  final UserData userData;

  const UserUpdateForm({Key? key, required this.userData}) : super(key: key);

  @override
  _UserUpdateFormState createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  void updateUser(String userId, Map<String, dynamic> updatedData) async {
    // Get a reference to the user document
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);

    // Update the document with the new data
    try {
      await userRef.update(updatedData);
      print('User with id $userId updated successfully');
    } catch (e) {
      print('Error updating user with id $userId: $e');
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.userData.firstname ?? "";
    _lastNameController.text = widget.userData.lastname ?? "";
    _ageController.text = widget.userData.age?.toString() ?? "";
    _emailController.text = widget.userData.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a first name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a last name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: "Age",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an age";
                  }
                  if (int.tryParse(value) == null) {
                    return "Please enter a valid age";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update the user data
                    final updatedData = {
                      'firstname': _firstNameController.text,
                      'lastname': _lastNameController.text,
                      'age': int.parse(_ageController.text),
                      'email': _emailController.text,
                    };
                    updateUser(widget.userData.id!, updatedData);

                    // Navigate back to the admin screen
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
