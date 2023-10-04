

// login_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/viewmodels/settingviewmodels/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<LoginViewModel>(
            builder: (_, viewModel, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    onChanged: (text) {
                      viewModel.email = text;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (text) {
                      viewModel.password = text;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: viewModel.logIn,
                    child: const Text('Log In'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
