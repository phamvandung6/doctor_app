part of 'regimen_cubit.dart';

sealed class RegimenState extends Equatable {
  const RegimenState();

  @override
  List<Object> get props => [];
}

final class RegimenInitial extends RegimenState {}

final class RegimenLoading extends RegimenState {}

final class RegimenLoaded extends RegimenState {
  final Stream<List<RegimenEntity>> regimens;
  const RegimenLoaded({required this.regimens});

  @override
  List<Object> get props => [regimens];
}

final class RegimenError extends RegimenState {
  final String? message;
  const RegimenError({this.message});

  @override
  List<Object> get props => [message!];
}