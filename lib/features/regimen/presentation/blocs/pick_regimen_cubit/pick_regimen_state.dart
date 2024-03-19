part of 'pick_regimen_cubit.dart';

final class PickRegimenState extends Equatable {
  final RegimenEntity regimen;
  const PickRegimenState(this.regimen);

  @override
  List<Object> get props => [regimen];
}
