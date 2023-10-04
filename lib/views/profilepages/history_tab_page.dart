

// history_tab_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/models/post.dart';

class HistoryTabPage extends StatelessWidget {
  final List<Post>? posts;
  final List<Post>? replyPosts;
  final List<Post>? bookmarks; 

  const HistoryTabPage({Key? key, this.posts, this.replyPosts, this.bookmarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'POST'),
              Tab(text: 'eqPOST'),
              Tab(icon: Icon(Icons.bookmark)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildListView(posts?.map((post) => post.caption).toList()),
                buildListView(replyPosts?.map((post) => post.caption).toList()),
                buildListView(bookmarks?.map((post) => post.caption).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<String>? captions) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        if (captions != null && index < captions.length) {
          return ListTile(
            title: Text(captions[index]),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
      itemCount: captions?.length ?? 0,
    );
  }
}
