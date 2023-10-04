

// post.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final double authenticity;
  final String caption;
  final double harmIndex;
  final int dateRange;
  final double bounty;
  final Timestamp timestamp;
  final int samePostCount;

  Post({
    required this.id,
    required this.authenticity,
    required this.caption,
    required this.harmIndex,
    required this.dateRange,
    required this.bounty,
    required this.timestamp,
    required this.samePostCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      authenticity: (json['authenticity'] as num).toDouble(),
      caption: json['caption'] as String,
      harmIndex: (json['harmIndex'] as num).toDouble(),
      dateRange: json['dateRange'] as int,
      bounty: (json['bounty'] as num).toDouble(),
      timestamp: json['timestamp'] as Timestamp,
      samePostCount: json['samePostCount'] as int,
    );
  }
}