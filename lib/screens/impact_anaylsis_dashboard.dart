import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class ImpactAnalysisDashboard extends StatefulWidget {
  final String cleanupId;

  const ImpactAnalysisDashboard({
    super.key,
    required this.cleanupId,
  });

  @override
  _ImpactAnalysisDashboardState createState() =>
      _ImpactAnalysisDashboardState();
}

class _ImpactAnalysisDashboardState extends State<ImpactAnalysisDashboard> {
  final FirestoreService _firestoreService = FirestoreService();
  double totalWasteReduction = 0;
  double totalWaterUsage = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchImpactData();
  }

  Future<void> _fetchImpactData() async {
    if (widget.cleanupId.isEmpty) {
      print('Error: cleanupId is empty');
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final data = await _firestoreService.getImpactData(widget.cleanupId);
      if (data!.isEmpty) {
        print('Error fetching impact data: Data is null or empty');
        setState(() {
          isLoading = false;
        });
        return;
      }

      setState(() {
        totalWasteReduction = data['wasteReduction']?.toDouble() ?? 0;
        totalWaterUsage = data['waterUsage']?.toDouble() ?? 0;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching impact data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impact Analysis'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Impact Analysis Results',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        _buildImpactCard(
                          'Waste Reduction',
                          '${totalWasteReduction.toStringAsFixed(2)} units',
                          Icons.recycling,
                          Colors.green,
                        ),
                        _buildImpactCard(
                          'Water Usage',
                          '${totalWaterUsage.toStringAsFixed(2)} liters',
                          Icons.water_drop,
                          Colors.blue,
                        ),
                        const SizedBox(height: 20),
                        _buildPlaceholderChart(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildImpactCard(
      String title, String data, IconData icon, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(data, style: const TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _buildPlaceholderChart() {
    return Container(
      height: 200,
      color: Colors.grey[300],
      child: const Center(
        child: Text('Chart Placeholder'),
      ),
    );
  }
}
