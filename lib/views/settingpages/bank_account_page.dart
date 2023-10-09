

// bank_account_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/viewmodels/settingviewmodels/bank_account_view_model.dart'; // Import your view model

class BankAccountSetupPage extends StatefulWidget {
  const BankAccountSetupPage({Key? key}) : super(key: key);

  @override
  BankAccountSetupPageState createState() => BankAccountSetupPageState();
}

class BankAccountSetupPageState extends State<BankAccountSetupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String bankName = '';
  String branchName = '';
  String accountType = '';
  String accountNumber = '';
  String accountHolder = '';

  @override
  Widget build(BuildContext context) {
    // Access the view model
    final viewModel = Provider.of<BankAccountViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('銀行口座登録'),
        backgroundColor: const Color.fromARGB(255, 56, 2, 2),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ... other text fields ...

              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    
                    // Call the ViewModel to register the bank account
                    await viewModel.registerBankAccount(
                      bankName: bankName,
                      branchName: branchName,
                      accountType: accountType,
                      accountNumber: accountNumber,
                      accountHolder: accountHolder,
                    );
                    
                    Navigator.pop(context);
                  }
                },
                child: const Text('登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
