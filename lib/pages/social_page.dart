import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

class Post {
  final String username; // User who created the post
  final String text; // Text content of the post
  final String? imageUrl; // Optional image URL for the post
  final DateTime timestamp; // Time when the post was created

  Post({
    required this.username,
    required this.text,
    this.imageUrl,
    required this.timestamp,
  });
}

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _imageFile;
  List<Post> _posts = []; // List to store posts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Social Feed',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            _buildSocialPostForm(context),
            const SizedBox(height: 20),
            _buildPostsList(), // Display list of posts
          ],
        ),
      ),
    );
  }

  Widget _buildSocialPostForm(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Create Social Post',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _textEditingController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Write your post'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please write something';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement social post creation logic
                _createPost(context);
              },
              child: const Text('Create Post'),
            ),
            const SizedBox(height: 10),
            _buildPhotoUploadButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUploadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement photo upload logic
        _uploadPhoto(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.camera_alt),
          SizedBox(width: 5),
          Text('Upload Photo'),
        ],
      ),
    );
  }

  Future<void> _uploadPhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Photo uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildPhotoPreview() {
    return _imageFile != null
        ? kIsWeb
            ? Image.network(
                '', // Provide actual URL if available or skip rendering
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
            : Image.file(
                _imageFile!,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
        : Container();
  }

  void _createPost(BuildContext context) {
    String postText = _textEditingController.text.trim();
    if (postText.isNotEmpty || _imageFile != null) {
      setState(() {
        _posts.add(Post(
          username: 'User', // Replace with actual username or user data
          text: postText,
          imageUrl: _imageFile != null ? _imageFile!.path : null,
          timestamp: DateTime.now(),
        ));
        _textEditingController.clear();
        _imageFile = null; // Clear image file after posting
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Social post created successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please write something or upload an image'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildPostsList() {
    return Column(
      children: _posts.map((post) => _buildPostItem(post)).toList(),
    );
  }

  Widget _buildPostItem(Post post) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              post.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(post.text),
            if (post.imageUrl != null) const SizedBox(height: 8),
            Image.file(
              File(post.imageUrl!),
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              '${post.timestamp}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
