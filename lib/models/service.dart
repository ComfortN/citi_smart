import 'package:flutter/material.dart';

class Service {
  final String name;
  final String location;
  final DateTime date;
  final TimeOfDay time;

  Service({
    required this.name,
    required this.location,
    required this.date,
    required this.time,
  });
}