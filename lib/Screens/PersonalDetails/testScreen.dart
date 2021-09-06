import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('Books');

    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //         'name': name, // John Doe
    //         'company': company, // Stokes and Sons
    //         'price': price // 42
    //       })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    return Scaffold(
      body: TextButton(
        onPressed: () {
          FirebaseFirestore.instance.collection("Books").add({
            "bookname": "The Monkey's Paw",
            'bookCoverImage':'https://i.redd.it/vqnx74b1v7o61.jpg',
            'bookdiscountedPrice': 540,
            'originalprice': 600,
            'offerPercentage': 10
          });
          print("user added succesfully");
        },
        child: Center(
          child: Text(
            "Add Books",
          ),
        ),
      ),
    );
  }
}
