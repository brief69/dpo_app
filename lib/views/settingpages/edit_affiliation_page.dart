

// edit_affiliation_page.dart
import 'package:flutter/material.dart';
import '../../viewmodels/settingviewmodels/edit_affiliation_viewmodel.dart';

class EditAffiliationPage extends StatefulWidget {
  const EditAffiliationPage({super.key});

  @override
  EditAffiliationPageState createState() => EditAffiliationPageState();
}

class EditAffiliationPageState extends State<EditAffiliationPage> {
  final TextEditingController _affiliationController = TextEditingController();
  
   final EditAffiliationViewModel viewModel = EditAffiliationViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affiliation'),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _affiliationController,
              decoration: const InputDecoration(labelText: 'Enter your affiliation'),
              style: const TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.updateAffiliation(_affiliationController.text);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
