import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {
  const PatientModel({
    super.address,
    super.birthday,
    super.gender,
    super.id,
    super.name,
    super.phone,
    super.weight,
    super.height,
    super.room,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      address: json['address'],
      birthday: json['birthday'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      weight: json['weight'],
      height: json['height'],
      room: json['room'],
    );
  }

  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      address: entity.address,
      birthday: entity.birthday,
      gender: entity.gender,
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      weight: entity.weight,
      height: entity.height,
      room: entity.room,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address ?? '',
      'birthday': birthday ?? '',
      'gender': gender ?? '',
      'id': id ?? '',
      'name': name ?? '',
      'phone': phone ?? '',
      'weight': weight ?? '',
      'height': height ?? '',
      'room': room ?? '',
    };
  }

  PatientModel copyWith({
    String? address,
    String? birthday,
    String? gender,
    String? id,
    String? name,
    String? phone,
    String? weight,
    String? height,
    String? room,
  }) {
    return PatientModel(
      address: address ?? this.address,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      room: room ?? this.room,
    );
  }

  @override
  List<Object?> get props => [
        address,
        birthday,
        gender,
        id,
        name,
        phone,
        weight,
        height,
        room,
      ];
}
