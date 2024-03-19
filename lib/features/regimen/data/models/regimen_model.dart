import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';

class RegimenModel extends RegimenEntity {
  const RegimenModel({
    super.beginTime,
    super.description,
    super.name,
    required super.patientId,
  });

  factory RegimenModel.fromEntity(RegimenEntity entity) {
    return RegimenModel(
      beginTime: entity.beginTime,
      description: entity.description,
      name: entity.name,
      patientId: entity.patientId,
    );
  }

  factory RegimenModel.fromJson(Map<String, dynamic> json) {
    return RegimenModel(
      beginTime: json['beginTime'],
      description: json['description'],
      name: json['name'],
      patientId: json['patientId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'beginTime': beginTime,
      'description': description,
      'name': name,
      'patientId': patientId,
    };
  }

  RegimenEntity toEntity() {
    return RegimenEntity(
      beginTime: beginTime,
      description: description,
      name: name,
      patientId: patientId,
    );
  }

  @override
  List<Object?> get props => [
        beginTime,
        description,
        name,
        patientId,
      ];
      
}
