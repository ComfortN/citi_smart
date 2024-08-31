import 'package:citi_smart/data/data_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to add cleanup data to Firestore
  Future<void> addCleanupData(CleanupData cleanupData) async {
    await _db.collection('cleanups').add(cleanupData.toMap());
  }

  // Stream to listen for cleanup data changes in Firestore
  Stream<List<CleanupData>> getCleanups() {
    return _db.collection('cleanups').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CleanupData.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  // Function to calculate total waste reduction
  Future<double> calculateTotalWasteReduction() async {
    QuerySnapshot querySnapshot = await _db.collection('cleanups').get();
    double totalWaste = 0;
    querySnapshot.docs.forEach((doc) {
      totalWaste += doc['wasteAmount'];
    });
    return totalWaste;
  }

  // Function to calculate total water usage
  Future<double> calculateTotalWaterUsage() async {
    QuerySnapshot querySnapshot = await _db.collection('cleanups').get();
    double totalWater = 0;
    querySnapshot.docs.forEach((doc) {
      totalWater += doc['waterUsed'];
    });
    return totalWater;
  }

  Future<Map<String, dynamic>?> getImpactData(String cleanupId) async {
    if (cleanupId.isEmpty) {
      print('Error: cleanupId is empty');
      return null;
    }

    try {
      final doc = await _db.collection('cleanups').doc(cleanupId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>?;
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching impact data: $e');
      return null;
    }
  }
}
