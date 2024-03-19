part of 'tpn_cubit.dart';

sealed class TpnState extends Equatable {
  const TpnState();

  @override
  List<Object> get props => [];
}

final class TpnInitial extends TpnState {}

final class TpnStep1State extends TpnState {}

final class TpnStep2State extends TpnState {
  final String typeInsulin;

  const TpnStep2State({required this.typeInsulin});

  @override
  List<Object> get props => [typeInsulin];
}

final class TpnStep3State extends TpnState {}

final class TpnError extends TpnState {
  final String message;

  const TpnError({required this.message});

  @override
  List<Object> get props => [message];
}