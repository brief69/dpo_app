

// post_actions_modal.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/homeviewmodels/post_actions_viewmodel.dart';
import 'edit_post_page.dart';
import 'evidence_submit_page.dart';

class PostActionsModal extends StatelessWidget {
  final String postId;  // postIdを受け取る
  const PostActionsModal({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<PostActionsViewModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('投稿削除'),
          onTap: () => viewModel.deletePost(postId),  // 正しくpostIdを渡して呼び出します
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('投稿編集'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditPostPage(initialPost: postId, postId: '',)),  // postIdを渡します
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.file_present),
          title: const Text('証拠提出'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EvidenceSubmitPage(postId: '',)),
            );
          },
        ),
      ],
    );
  }
}
