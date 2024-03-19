part of 'check_time_cubit.dart';

sealed class CheckTimeState extends Equatable {
  const CheckTimeState();

  @override
  List<Object> get props => [];
}

final class CheckTimeInitial extends CheckTimeState {}

final class CheckTimeSuccess extends CheckTimeState {}

final class CheckTimeFailed extends CheckTimeState {
  final String message;
  const CheckTimeFailed({required this.message});

  @override
  List<Object> get props => [message];
}

final class CompleteTpnRegimen extends CheckTimeState {}