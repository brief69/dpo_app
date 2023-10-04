

// rules_page.dart
import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Public Opinion Rules', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 90, 0, 0),
          bottom: const TabBar(
            tabs: [
            Tab(text: 'PUBOP User Rules'),
              Tab(text: 'PUBOP Management Rules'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserRulesTab(),
            ManagementRulesTab(),
          ],
        ),
      ),
    );
  }
}

class UserRulesTab extends StatelessWidget {
  const UserRulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('自分と対等、友達、家族とのトラブルでの投稿は即垢BANとその他のあらゆる措置の対象になる。'),
        ),
        ListTile(
          title: Text('自分の所属している会社の上司や投稿する相手方が特定の人物である場合、その人物の会社名や自分よりも強い立場である文を記さなければならない。'),
        ),
        ListTile(
          title: Text('Public Opinionは、分散型悪質証明プラットフォームです。'),
        ),
        ListTile(
          title: Text('public opinionは、企業のための個人信用情報機関などのプラットフォームの、個人のための企業、組織を対象としたバージョンです。'),
        ),
        ListTile(
          title: Text('public opinionで一定以上の悪質な報告の数と証拠、送料が認められた場合、Blac Listに登録されます。Blac Listとは、悪質である証明が終わっていることを示すプラットフォームであり、絶対に取引をしてはならない対象のデータとして登録、使用されます。'), // 同上
        ),
        ListTile(
          title: Text('Public Opinionは、必ずしも怒りに任せた誇大な投稿を禁止しません。これは、数と総量が証明の本質であり、投稿の内容は対象となる行為でしかないためです。'), // 同上
        ),
        ListTile(
          title: Text('Public Opinionは、あくまで'), // 同上
        ),
        ListTile(
          title: Text('ユーザールール8'), // 同上
        ),
        ListTile(
          title: Text('ユーザールール9'), // 同上
        ),
      ],
    );
  }
}

class ManagementRulesTab extends StatelessWidget {
  const ManagementRulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('運営ルール1'),
        ),
        ListTile(
          title: Text('運営ルール2'),
        ),
        ListTile(
          title: Text('運営ルール3'),
        ),
        ListTile(
          title: Text('運営ルール4'),
        ),
        ListTile(
          title: Text('運営ルール5'),
        ),
        ListTile(
          title: Text('運営ルール6'),
        ),
        ListTile(
          title: Text('運営ルール7'),
        ),
        ListTile(
          title: Text('運営ルール8'),
        ),
        ListTile(
          title: Text('運営ルール9'),
        ),
      ],
    );
  }
}

