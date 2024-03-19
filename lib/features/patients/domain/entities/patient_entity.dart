import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {
  final String? id;
  final String? name;
  final String? gender;
  final String? room;
  final String? phone;
  final String? height;
  final String? weight;
  final String? address;
  final String? birthday;

  const PatientEntity({
    this.id,
    this.name,
    this.gender,
    this.room,
    this.phone,
    this.height,
    this.weight,
    this.address,
    this.birthday,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        room,
        phone,
        height,
        weight,
        address,
        birthday,
      ];
}
