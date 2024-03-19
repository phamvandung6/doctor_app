import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MedicalTakeInsulin extends Equatable {
  final String? insulinType;
  final num? insulinUI;
  final String name;
  final Timestamp? time;

  const MedicalTakeInsulin({
    this.insulinType,
    this.insulinUI,
    this.name = "Medical Check Insulin",
    this.time,
  });

  @override
  List<Object?> get props => [
        insulinType,
        insulinUI,
        name,
        time,
      ];

  MedicalTakeInsulin copyWith({
    String? insulinType,
    num? insulinUI,
    String? name,
    Timestamp? time,
  }) {
    return MedicalTakeInsulin(
      insulinType: insulinType ?? this.insulinType,
      insulinUI: insulinUI ?? this.insulinUI,
      name: name ?? this.name,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'insulinType': insulinType ?? '',
      'insulinUI': insulinUI ?? '',
      'name': name,
      'time': time ?? Timestamp.now(),
    };
  }

  factory MedicalTakeInsulin.fromJson(Map<String, dynamic> json) {
    return MedicalTakeInsulin(
      insulinType: json['insulinType'],
      insulinUI: json['insulinUI'],
      name: json['name'],
      time: json['time'],
    );
  }
}
