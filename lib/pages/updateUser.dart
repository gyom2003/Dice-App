import 'package:fapp/components/button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

class UpdateUserPage extends StatefulWidget {
  final String uid;

  const UpdateUserPage({required this.uid});

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> updateUser({
    required String? uid,
    String? firstname,
    String? lastname,
    int? age,
    String? email,
  }) async {
    try {
      final users = FirebaseFirestore.instance.collection('users');
      await users.doc(uid).update({
        if (firstname != null) "firstname": firstname,
        if (lastname != null) "lastname": lastname,
        if (age != null) "age": age,
        if (email != null) "email": email,
      });
      print("User updated successfully");
    } catch (e) {
      print("Error updating user: $e");
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get()
        .then((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      _firstnameController.text = data['firstname'];
      _lastnameController.text = data['lastname'];
      _ageController.text = data['age'].toString();
      _emailController.text = data['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.grey[500],
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.grey),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/profile_img.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: SvgPicture.asset(
                                'lib/assets/camera.svg',
                                colorFilter: ColorFilter.mode(
                                  Colors.grey[800]!,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _firstnameController,
                          decoration: const InputDecoration(
                            hintText: 'first name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _lastnameController,
                          decoration: const InputDecoration(
                            hintText: 'Last name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _ageController,
                          decoration: const InputDecoration(
                            hintText: 'Age',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Button(
                        onTap: () async {
                          final firstname = _firstnameController.text;
                          final lastname = _lastnameController.text;
                          final age = int.tryParse(_ageController.text);
                          final email = _emailController.text;

                          await updateUser(
                            uid: widget.uid,
                            firstname: firstname,
                            lastname: lastname,
                            age: age,
                            email: email,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              duration: const Duration(milliseconds: 900),
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child:
                                    const Text('Profile updated successfully'),
                              ),
                            ),
                          );
                        },
                        text: 'Update',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
