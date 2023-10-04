

// bank_account_page.dart
import 'package:flutter/material.dart';

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
              TextFormField(
                decoration: const InputDecoration(labelText: '銀行名'),
                validator: (value) => value!.isEmpty ? '必須項目です' : null,
                onSaved: (value) => bankName = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '支店名'),
                validator: (value) => value!.isEmpty ? '必須項目です' : null,
                onSaved: (value) => branchName = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '口座種別'),
                validator: (value) => value!.isEmpty ? '必須項目です' : null,
                onSaved: (value) => accountType = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '口座番号'),
                validator: (value) => value!.isEmpty ? '必須項目です' : null,
                onSaved: (value) => accountNumber = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '口座名義人'),
                validator: (value) => value!.isEmpty ? '必須項目です' : null,
                onSaved: (value) => accountHolder = value!,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO #16:銀行口座登録完了画面に遷移するコードを書く
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


