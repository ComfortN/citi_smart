import 'package:flutter/material.dart';

class UpdateDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the detail text passed from the previous page
    final String detail = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Details'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          detail,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
