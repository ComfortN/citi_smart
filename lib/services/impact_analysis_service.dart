import 'package:cloud_firestore/cloud_firestore.dart';

class ImpactAnalysisService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getImpactData(String cleanupId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('impactResults').doc(cleanupId).get();

      if (snapshot.exists) {
        return snapshot.data() ?? {};
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      print('Error fetching impact data: $e');
      return {'error': e.toString()}; // Return error information if needed
    }
  }
}

