import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

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

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _textController = TextEditingController();
  File? _imageFile;
  String? _imageUrl; // For web, handle URLs
  bool _isCreatingPost = false;
  int _selectedIndex = 3; // Index for Social Feed

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _imageUrl = pickedFile.path; // Use the path for web
        } else {
          _imageFile = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _uploadPost() async {
    final text = _textController.text;
    if (text.isEmpty) return;

    String imageUrl = '';
    if (_imageFile != null) {
      final ref = _storage
          .ref()
          .child('post_images/${DateTime.now().toIso8601String()}');
      final uploadTask = ref.putFile(_imageFile!);
      final snapshot = await uploadTask.whenComplete(() => {});
      imageUrl = await snapshot.ref.getDownloadURL();
    } else if (_imageUrl != null) {
      imageUrl = _imageUrl!; // Use the URL for web
    }

    final post = Post(
      id: DateTime.now().toIso8601String(),
      userId: 'userId', // Replace with actual user ID
      text: text,
      imageUrl: imageUrl,
      timestamp: Timestamp.now(),
    );

    await _firestore.collection('posts').add(post.toMap());

    setState(() {
      _isCreatingPost = false;
      _textController.clear();
      _imageFile = null;
      _imageUrl = null; // Clear image URL
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Feed'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          if (_isCreatingPost) ...[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    decoration:
                        InputDecoration(labelText: 'What\'s on your mind?'),
                  ),
                  SizedBox(height: 8.0),
                  _imageFile != null || _imageUrl != null
                      ? (kIsWeb
                          ? Image.network(_imageUrl!,
                              height: 200, fit: BoxFit.cover) // Use URL for web
                          : Image.file(_imageFile!,
                              height: 200,
                              fit: BoxFit.cover)) // Use file for mobile
                      : ElevatedButton(
                          onPressed: _pickImage,
                          child: Text('Pick an Image'),
                        ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _uploadPost,
                    child: Text('Post'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('posts')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No posts yet.'));
                }

                final posts = snapshot.data!.docs
                    .map((doc) => Post.fromDocument(doc))
                    .toList();

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostTile(post: post);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isCreatingPost = !_isCreatingPost;
          });
        },
        child: Icon(_isCreatingPost ? Icons.close : Icons.add),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Social Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to Home (if needed)
              break;
            case 1:
              Navigator.pushNamed(context, '/create');
              break;
            case 2:
              Navigator.pushNamed(context, '/social');
              break;
            case 3:
              Navigator.pushNamed(context, '/account');
              break;
            case 4:
              Navigator.pushNamed(context, '/edu');
              break;
            case 5:
              Navigator.pushNamed(context, '/donation');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final Post post;

  PostTile({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.text,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            post.imageUrl.isNotEmpty
                ? (kIsWeb
                    ? Image.network(post.imageUrl,
                        height: 250,
                        fit: BoxFit.cover) // For web, show bigger image
                    : Image.network(post.imageUrl,
                        height: 250,
                        fit: BoxFit.cover)) // For mobile, show bigger image
                : SizedBox(),
            SizedBox(height: 8.0),
            Text(
              'Posted on: ${post.timestamp.toDate().toString()}',
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
