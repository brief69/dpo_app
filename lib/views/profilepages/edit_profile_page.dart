

// editprofile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/viewModels/profile_viewmodel.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (_, viewModel, __) {
          final TextEditingController usernameController = TextEditingController(text: viewModel.profile?.name ?? '');

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    onChanged: viewModel.updateUsername,
                    decoration: const InputDecoration(labelText: "Username"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.saveProfileChanges();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    child: const Text("保存"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
