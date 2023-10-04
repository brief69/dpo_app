
// home_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/homeviewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:dpo/models/post.dart';
import 'package:dpo/views/homepages/post_actions_modal.dart';
import 'package:dpo/views/homepages/post_detail_page.dart';
import 'package:dpo/views/homepages/eqpost_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 85, 6, 1),
            title: _buildSearchForm(),
          ),
          backgroundColor: const Color(0xFF8A0000),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 56.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Text(
                              'TARGET',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'BOUNTY',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final post = model.posts[index];
                    return buildPostTile(post, context);
                  },
                  childCount: model.posts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // The search form to be placed in the app bar.
  // アプリバーに配置される検索フォーム。
  Widget _buildSearchForm() {
    return TextField(
      // Settings for the appearance of the text input field.
      // テキスト入力フィールドの見た目の設定。
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.red,
        hintText: 'Search...',
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  // Building a ListTile for a given post
  // 与えられた投稿のためのListTileを構築
  ListTile buildPostTile(Post post, BuildContext context) {
    return ListTile(
      // Setting post properties
      // 投稿のプロパティを設定
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      title: Text(
        formatCaptionForHomePage(post.caption),
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          Image.asset('assets/icons/authscore_icon.png', width: 20, height: 20, color: Colors.white),
          const SizedBox(width: 4.0),
          Text('${post.authenticity}/8', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 8.0),
          Image.asset('assets/icons/harmIndex_icon.png', width: 20, height: 20, color: const Color.fromRGBO(255, 255, 255, 1)),
          Text('${post.harmIndex}', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EqPostPage(originalPost: post), 
                ),
              );
            },
            child: const Text('同一投稿'),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailPage(post: post),
          ),
        );
      },
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'BOUNTY: ${post.bounty}',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white), 
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const PostActionsModal(postId: '',),
              );
            },
          ),
        ],
      ),
    );
  }

  // Format the caption for display in the list
  // リストに表示するためのキャプションを整形
  String formatCaptionForHomePage(String caption) {
    if (caption.length > 60) {
      return "${caption.substring(0, 60)}...";
    } else {
      return caption;
    }
  }
}