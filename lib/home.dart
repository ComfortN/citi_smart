import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.lightGreen,

                    Icon(Icons.eco, size: 80, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sansita Swashed',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildSection(
                    title: 'Latest Updates',
                    content: Column(
                      children: <Widget>[
                        _buildUpdateCard(
                          'Citi-Smart Drive',
                          'Join us for a cleanup event this Saturday at the central park.',
                          Icons.cleaning_services,
                          Colors.green,
                        ),
                        const SizedBox(height: 10),
                        _buildUpdateCard(
                          'Recycling Workshop',
                          'Learn how to recycle effectively and reduce waste in our workshop.',
                          Icons.recycling,
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Community Reports',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildReportCard('Water Issues', Icons.water_damage, Colors.blue),
                        _buildReportCard('Electricity Outages', Icons.power, Colors.yellow),
                        _buildReportCard('Road Conditions', Icons.traffic, Colors.brown),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Discover Our Services',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildService('Tutoring', Icons.school, Colors.grey),
                        _buildService('Cleaning', Icons.cleaning_services, Colors.blue),
                        _buildService('Planting', Icons.local_florist, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildActionButton('Report Issue', 'Municipal problems', Icons.report, Colors.orange),
                      _buildActionButton('Book Service', 'Home care services', Icons.book, Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
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
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _buildUpdateCard(String title, String description, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: iconColor, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard(String type, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 40,
        ),
        const SizedBox(height: 5),
        Text(
          type,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildService(String service, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 40,
        ),
        const SizedBox(height: 5),
        Text(
          service,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, String subtitle, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
