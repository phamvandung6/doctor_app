import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MedicalCheckGlucose extends Equatable {
  final num? glucoseUI;
  final String name;
  final Timestamp? time;

  const MedicalCheckGlucose({
    this.glucoseUI,
    this.name = "Medical Check Glucose",
    this.time,
  });

  @override
  List<Object?> get props => [
        glucoseUI,
        name,
        time,
  ];

  Map<String, dynamic> toJson() {
    return {
      'glucoseUI': glucoseUI ?? '',
      'name': name,
      'time': time ?? Timestamp.now(),
    };
  }

  factory MedicalCheckGlucose.fromJson(Map<String, dynamic> json) {
    return MedicalCheckGlucose(
      glucoseUI: json['glucoseUI'],
      name: json['name'],
      time: json['time'],
    );
  }

  MedicalCheckGlucose copyWith({
    num? glucoseUI,
    String? name,
    Timestamp? time,
  }) {
    return MedicalCheckGlucose(
      glucoseUI: glucoseUI ?? this.glucoseUI,
      name: name ?? this.name,
      time: time ?? this.time,
    );
  }
}
