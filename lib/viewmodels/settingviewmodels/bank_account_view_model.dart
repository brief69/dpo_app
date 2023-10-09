

// bank_account_view_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class BankAccountViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerBankAccount({
    required String bankName,
    required String branchName,
    required String accountType,
    required String accountNumber,
    required String accountHolder,
  }) async {
    try {
      // Replace 'bank_accounts' with your actual collection name
      CollectionReference accounts = _firestore.collection('bank_accounts');

      // Add a new document with auto-generated ID
      await accounts.add({
        'bankName': bankName,
        'branchName': branchName,
        'accountType': accountType,
        'accountNumber': accountNumber,
        'accountHolder': accountHolder,
      });

      print('Bank account registered successfully!');
    } catch (e) {
      print('Failed to register bank account: $e');
      throw e; // Re-throw the exception for further handling
    }
  }
}
