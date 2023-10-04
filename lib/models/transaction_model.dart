

// transaction_model.dart
// 入出金履履歴を管理するトランザクションモデル

class Transaction {
  final String id;
  final double amount;
  final String title;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.amount,
    required this.title,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
