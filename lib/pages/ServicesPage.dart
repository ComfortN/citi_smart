import 'package:flutter/material.dart';
import '../models/service.dart'; // Import the Service model

class ServicesPage extends StatelessWidget {
  final List<Service> services;

  const ServicesPage({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(service.name, style: const TextStyle(fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: ${service.location}'),
                  Text('Date: ${service.date.toLocal()}'),
                  Text('Time: ${service.time.format(context)}'),
                ],
              ),
            ),
          );
        },
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
              Navigator.pushNamed(context, '/home');
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
