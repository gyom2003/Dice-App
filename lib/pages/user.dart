import "package:cloud_firestore/cloud_firestore.dart";
import "package:fapp/components/button.dart";
import 'package:fapp/pages/updateUser.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

final user = FirebaseAuth.instance.currentUser;
final userId = user?.uid;

class UserData {
  final String? firstname;
  final String? lastname;
  final int? age;
  final String? email;

  UserData({
    this.firstname,
    this.lastname,
    this.age,
    this.email,
  });

  factory UserData.fromFirestore(DocumentSnapshot<Object?> documentSnapshot) {
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      return UserData(email: null, firstname: null, lastname: null, age: null);
    }
    return UserData(
      firstname: data['firstname'] as String?,
      lastname: data['lastname'] as String?,
      age: data['age'] as int?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (firstname != null) "firstname": firstname,
      if (lastname != null) "lastname": lastname,
      if (age != null) "age": age,
      if (email != null) "email": email,
    };
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserData? currentUserData;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void getData() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    users.doc(currentUser.uid).get().then((docSnapshot) {
      print(currentUser.uid);
      if (docSnapshot.exists) {
        setState(() {
          currentUserData = UserData.fromFirestore(docSnapshot);
        });
      } else {
        print("Document does not exist");
      }
    }, onError: (e) => print("Error completing: $e"));
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Firebase initialized");
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'User',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.grey[500],
        child: Center(
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
                        backgroundImage:
                            AssetImage('lib/assets/profile_img.jpg'),
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
              currentUserData != null
                  ? Column(
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: SizedBox(
                            height: 65,
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'First name',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${currentUserData!.firstname}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: SizedBox(
                            height: 65,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Last name',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${currentUserData!.lastname}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: SizedBox(
                            height: 65,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Age',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${currentUserData!.age}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: SizedBox(
                            height: 65,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${currentUserData!.email}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Button(
                onTap: () {
                  final user = FirebaseAuth.instance.currentUser;
                  final userId = user?.uid;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          UpdateUserPage(uid: userId!),
                    ),
                  );
                },
                text: 'Edit User',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
