

// registration_view.dart
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/registration_viewmodel.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  RegistrationViewState createState() => RegistrationViewState();
}

class RegistrationViewState extends State<RegistrationView> {
  final _emailController = TextEditingController();
  final _viewModel = RegistrationViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: Column(
        children: [
          TextField(controller: _emailController),
          ElevatedButton(
            onPressed: () {
              _viewModel.registerAndCreateWallet(_emailController.text);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
