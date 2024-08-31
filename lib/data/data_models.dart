class CleanupData {
  final String userId;
  final DateTime date;
  final String location;
  final String wasteType;
  final double wasteAmount; //in metrics used
  final double waterUsed; 

 
  CleanupData({
    required this.userId,
    required this.date,
    required this.location,
    required this.wasteType,
    required this.wasteAmount,
    required this.waterUsed,
  });

  
  //This converts cleanup data objects to a map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date.toIso8601String(),
      'location': location,
      'wasteType': wasteType,
      'wasteAmount': wasteAmount,
      'waterUsed': waterUsed,
    };
  }

 
  factory CleanupData.fromMap(Map<String, dynamic> map) {
    return CleanupData(
      userId: map['userId'],
      date: DateTime.parse(map['date']),
      location: map['location'],
      wasteType: map['wasteType'],
      wasteAmount: map['wasteAmount'],
      waterUsed: map['waterUsed'],
    );
  }
}
