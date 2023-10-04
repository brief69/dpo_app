

// eqpost_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/models/post.dart';
import 'package:dpo/viewmodels/homeviewmodels/eqpost_viewmodel.dart';
import 'package:dpo/views/homepages/post_detail_page.dart';

class EqPostPage extends StatelessWidget {
  final Post originalPost;

  const EqPostPage({super.key, required this.originalPost});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EqPostViewModel()..fetchReplies(originalPost.id),
      child: Scaffold(
        backgroundColor: const Color(0xFF8A0000),
        appBar: AppBar(title: const Text('同一投稿', style: TextStyle(color: Colors.white))),
        body: Consumer<EqPostViewModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                ListTile(
                  title: Text(originalPost.caption),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(post: originalPost)));
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.replies.length,
                    itemBuilder: (context, index) {
                      final eq = model.replies[index];
                      return ListTile(title: Text(eq.content));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
