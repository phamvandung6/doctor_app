import 'package:equatable/equatable.dart';

class TpnEntity extends Equatable {
  final String? description;
  final List<dynamic>? medicalActions;
  final String? tpnType;
  final String? step;
  final num? passingCount;
  final num? unPassingCount;

  const TpnEntity({
    this.description,
    this.medicalActions,
    this.tpnType,
    this.step,
    this.passingCount,
    this.unPassingCount,
  });

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