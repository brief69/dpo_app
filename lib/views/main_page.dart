

// main_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/views/homepages/home_page.dart';
import 'package:dpo/views/post_page.dart';
import 'package:dpo/views/profilepages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material( 
        color: const Color.fromARGB(255, 56, 3, 3), 
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white, 
          labelColor: const Color.fromARGB(255, 114, 12, 5),  
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.post_add)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomePage(),
          PostPage(),// TODO: ユーザーが登録をしていない場合、投稿ページに遷移するとエラーが発生し、投稿ページを表示する前にユーザーが登録をしているかどうかを確認する
          ProfilePage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
