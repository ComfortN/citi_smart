import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _donationType;
  Future<void> _submitDonation() async {
    print('Submit donation button clicked'); // Debug log
    final String name = _nameController.text;
    final String contact = _contactController.text;
    final String amount = _amountController.text;

    if (name.isEmpty ||
        contact.isEmpty ||
        amount.isEmpty ||
        _donationType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Validate that the amount is a valid number
    if (double.tryParse(amount) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    try {
      print('Attempting to add donation to Firestore');
      await FirebaseFirestore.instance.collection('donations').add({
        'name': name,
        'contact': contact,
        'amount': double.parse(amount),
        'donationType': _donationType,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Donation successfully added to Firestore');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thank you for your donation!')),
      );

      _nameController.clear();
      _contactController.clear();
      _amountController.clear();
      setState(() {
        _donationType = null;
      });
    } catch (e) {
      print('Error adding donation to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit donation: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        color: Colors.blue[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Make a Donation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your donations help us continue our mission of promoting environmental conservation...',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(
                labelText: 'Contact Details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Donation Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Money',
                      groupValue: _donationType,
                      onChanged: (String? value) {
                        setState(() {
                          _donationType = value;
                        });
                      },
                    ),
                    const Text('Money'),
                    Radio<String>(
                      value: 'Books',
                      groupValue: _donationType,
                      onChanged: (String? value) {
                        setState(() {
                          _donationType = value;
                        });
                      },
                    ),
                    const Text('Books'),
                    Radio<String>(
                      value: 'Cleaning Products',
                      groupValue: _donationType,
                      onChanged: (String? value) {
                        setState(() {
                          _donationType = value;
                        });
                      },
                    ),
                    const Text('Cleaning Products'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _submitDonation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Donate Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
