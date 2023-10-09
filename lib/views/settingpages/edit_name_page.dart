

// edit_name_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  EditNamePageState createState() => EditNamePageState();
}

class EditNamePageState extends State<EditNamePage> {
  final TextEditingController _nameController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
        backgroundColor: const Color.fromARGB(255, 53, 0, 0),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
              style: const TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () async { // Make sure to mark this as async
                // TODO: Validate if the name is not empty and other business rules

                // Assuming you have a users collection, and each document ID is the user's UID
                // Replace 'uid' with the actual current user's UID
                DocumentReference userDocRef = _firestore.collection('users').doc('uid');

                // Before updating, you might want to check if the name is already set or not
                DocumentSnapshot userData = await userDocRef.get();
                
                if (userData.exists && userData['name'] == null) { // Replace 'name' with your actual field name
                  // If name is not set, then update
                  await userDocRef.update({
                    'name': _nameController.text, // Replace 'name' with your actual field name
                  });

                  // Pop with updated name
                  Navigator.pop(context, _nameController.text);
                } else {
                  // Show error or message that name can't be updated
                  // You should handle this based on your app's UX design
                  print('Name is already set and cannot be updated'); // Replace this with your error handling logic
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
