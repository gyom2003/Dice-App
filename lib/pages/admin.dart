import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "adminUpdateForm.dart";

void _editUser(BuildContext context, UserData userData) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserUpdateForm(userData: userData),
    ),
  );
}

class UserData {
  final String? id;
  final String? firstname;
  final String? lastname;
  final int? age;
  final String? email;

  UserData({
    this.id,
    this.firstname,
    this.lastname,
    this.age,
    this.email,
  });

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      id: snapshot.id,
      firstname: data?['firstname'],
      lastname: data?['lastname'],
      age: data?['age'],
      email: data?['email'],
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

final db = FirebaseFirestore.instance;
final users = db.collection('users');

List<UserData> userDataList = [];

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  void getData() {
    users.get().then(
      (querySnapshot) {
        final List<UserData> data = [];
        for (var docSnapshot in querySnapshot.docs) {
          final userData = UserData.fromFirestore(docSnapshot, null);
          data.add(userData);
        }
        setState(() {
          userDataList = data;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  void _deleteUser(String? userId) async {
    try {
      await users.doc(userId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Utilisateur supprimé avec succès."),
        ),
      );
      setState(() {
        userDataList.removeWhere((userData) => userData.id == userId);
      });
      // // get the user from Firebase Auth
      // final UserData? user = _auth.currentUser;

      // // delete the user from Firebase Auth if it matches the ID
      // if (user != null && user.uid == userId) {
      //   await user.delete();
      // }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erreur lors de la suppression de l'utilisateur."),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'Admin',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Center(
              child: Text(
                "Users List",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: userDataList.length,
              itemBuilder: (BuildContext context, int index) {
                final userData = userDataList[index];
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "${index + 1}. First Name: ${userData.firstname}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Last Name: ${userData.lastname}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Age: ${userData.age}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Email: ${userData.email}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            if (userData.id != null) {
                              _editUser(context, userData);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "L'ID de l'utilisateur est manquant. Veuillez contacter l'administrateur pour résoudre ce problème"),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteUser(userData.id);
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
