

// wallet_tab_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/models/transaction_model.dart' as my_trans;

class WalletTabPage extends StatelessWidget {
  final double? balance;                              // 残高
  final List<my_trans.Transaction>? geneTransactions; // 生成・付与された履歴
  final List<my_trans.Transaction>? histTransactions; // 入出金履歴

  const WalletTabPage({
    Key? key,
    this.balance,
    this.geneTransactions,
    this.histTransactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'BRAN'),
              Tab(text: 'GENE'),
              Tab(text: 'HIST'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    balance?.toString() ?? '0',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                buildListView(geneTransactions),
                buildListView(histTransactions),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<my_trans.Transaction>? data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        if (data != null && index < data.length) {
          return ListTile(
            title: Text(data[index].title),
            trailing: Text(data[index].amount.toString()),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
      itemCount: data?.length ?? 0,
    );
  }
}
