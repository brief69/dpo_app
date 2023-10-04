

// post_detail_viewmodel.dart

import 'package:flutter/material.dart';
import '../../models/post.dart';

class PostDetailViewModel extends ChangeNotifier {
  final Post post;

  PostDetailViewModel({required this.post});

  // 必要に応じてロジックや関数を追加
}
