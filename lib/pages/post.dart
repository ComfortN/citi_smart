import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userId;
  final String text;
  final String imageUrl;
  final Timestamp timestamp;

  Post({
    required this.id,
    required this.userId,
    required this.text,
    required this.imageUrl,
    required this.timestamp,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      userId: data['userId'] ?? '',
      text: data['text'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'text': text,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}
