part of 'get_history_cubit.dart';

sealed class GetHistoryState extends Equatable {
  const GetHistoryState();

  @override
  List<Object> get props => [];
}

final class GetHistoryInitial extends GetHistoryState {}

final class GetHistoryLoading extends GetHistoryState {}

// ignore: must_be_immutable
final class GetTpnHistorySuccess extends GetHistoryState {
  List<dynamic> medicalActions;
  GetTpnHistorySuccess(this.medicalActions);

  @override
  List<Object> get props => [medicalActions];
}

final class GetHistoryError extends GetHistoryState {
  final String message;
  const GetHistoryError({required this.message});

  @override
  List<Object> get props => [message];
}
