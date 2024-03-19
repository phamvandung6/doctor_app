import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RegimenEntity extends Equatable {
  final String? name;
  final String? description;
  final Timestamp? beginTime;
  final String patientId;

  const RegimenEntity({
    this.name,
    this.description,
    this.beginTime,
    required this.patientId,
  });

  @override
  List<Object?> get props => [name, description, beginTime, patientId];
}
