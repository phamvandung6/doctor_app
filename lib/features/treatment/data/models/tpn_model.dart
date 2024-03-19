import 'package:doctor_app/features/treatment/domain/entities/tpn_entity.dart';

class TpnModel extends TpnEntity {
  const TpnModel({
    super.description,
    super.medicalActions,
    super.tpnType,
    super.step,
    super.passingCount,
    super.unPassingCount,
  });

  factory TpnModel.fromJson(Map<String, dynamic> json) {
    return TpnModel(
      description: json['description'],
      medicalActions: json['medicalActions'],
      tpnType: json['tpnType'],
      step: json['step'],
      passingCount: json['passingCount'],
      unPassingCount: json['unPassingCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'medicalActions': medicalActions,
      'tpnType': tpnType,
      'step': step,
      'passingCount': passingCount,
      'unPassingCount': unPassingCount,
    };
  }

  TpnModel copyWith({
    String? description,
    List<dynamic>? medicalActions,
    String? tpnType,
    String? step,
    num? passingCount,
    num? unPassingCount,
  }) {
    return TpnModel(
      description: description ?? this.description,
      medicalActions: medicalActions ?? this.medicalActions,
      tpnType: tpnType ?? this.tpnType,
      step: step ?? this.step,
      passingCount: passingCount ?? this.passingCount,
      unPassingCount: unPassingCount ?? this.unPassingCount,
    );
  }

  @override
  List<Object?> get props => [
        description,
        medicalActions,
        tpnType,
        step,
        passingCount,
        unPassingCount,
      ];
}
