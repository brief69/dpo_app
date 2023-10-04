

// edit_post_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/viewmodels/homeviewmodels/edit_post_viewmodel.dart';

class EditPostPage extends StatelessWidget {
  final String postId;
  final String initialPost;

  EditPostPage({super.key, required this.initialPost, required this.postId});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = initialPost;

    final viewModel = Provider.of<EditPostViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿編集"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await viewModel.savePost(postId, _controller.text);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null, // 複数行入力を許可する
          decoration: const InputDecoration(
            hintText: "投稿を編集",
          ),
        ),
      ),
    );
  }
}
