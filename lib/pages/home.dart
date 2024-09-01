import 'package:citi_smart/pages/account_page.dart';
import 'package:citi_smart/pages/create_page.dart';
import 'package:citi_smart/pages/donation_page.dart';
import 'package:citi_smart/pages/edu_page.dart';
import 'package:citi_smart/pages/ServicesPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citi smart',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/create': (context) => CreatePage(),
        '/account': (context) => AccountPage(),
        '/donation': (context) => DonationPage(),
        '/edu': (context) => EducationalPage(),
        '/services': (context) => ServicesPage(services: []),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  get services => null;

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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Green Simple Eco Energy Logo1.png', // Replace the Icon with your image
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    const Text(
                      'ECOMOBILIZE, CLEAN, EARN, EDUCATE', // Add the desired text if needed
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
                          context,
                          'Citi-Smart Drive',
                          'Join us for a cleanup event this Saturday at the central park.',
                          Icons.cleaning_services,
                          Colors.green,
                        ),
                        const SizedBox(height: 10),
                        _buildUpdateCard(
                          context,
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
                        _buildReportCard(
                          'Water Issues',
                          Icons.water_damage,
                          Colors.blue,
                        ),
                        _buildReportCard(
                          'Littering',
                          Icons.delete_outline,
                          Colors.green,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Discover Our Services',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildService(
                          'Cleaning',
                          Icons.cleaning_services,
                          Colors.blue,
                        ),
                        _buildService(
                          'Planting',
                          Icons.local_florist,
                          Colors.green,
                        ),
                        _buildService(
                          'Skills Workshop',
                          Icons.work,
                          Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildActionButton(
                        context,
                        title: 'Educational Page',
                        icon: Icons.school,
                        color: Colors.orange,
                        route: '/edu', // Route name for EducationalPage
                      ),
                      _buildActionButton(
                        context,
                        title: 'Donations',
                        icon: Icons.volunteer_activism,
                        color: Colors.blue,
                        route: '/donation', //route name for DonationPage
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/impact'); // Navigate to Impact Analysis
                    },
                    child: const Text('View Impact Analysis'),
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
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _buildUpdateCard(
    BuildContext context, // Add BuildContext parameter
    String title, String description, IconData icon, Color iconColor) {
  return GestureDetector(
    onTap: () {
      // Navigate to ServicesPage
      Navigator.pushNamed(
        context,
        '/services',
        arguments: {
          'services': services
        },
      );
    },
    child: Container(
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
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
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

  Widget _buildActionButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required String route}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
