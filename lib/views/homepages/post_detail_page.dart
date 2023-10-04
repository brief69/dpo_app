

// post_detail_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/post.dart';
import '../../viewmodels/homeviewmodels/post_detail_viewmodel.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostDetailViewModel(post: post),
      child: Consumer<PostDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: const Text('Detail', style: TextStyle(color: Colors.white))),
          backgroundColor: const Color(0xFF8A0000),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.post.caption,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _detailItem('Authenticity', model.post.authenticity.toString()),
                _detailItem('Harm Index', model.post.harmIndex.toString()),
                _detailItem('Bounty', model.post.bounty.toString()),
                _detailItem('期間', model.post.dateRange.toString()),
                _detailItem('Timestamp', model.post.timestamp.toDate().toString()),
                // TODO: 他の詳細情報やデザインの改善
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailItem(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              detail,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


