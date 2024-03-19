part of 'check_glucose_on_time_cubit.dart';

sealed class CheckGlucoseOnTimeState extends Equatable {
  const CheckGlucoseOnTimeState();

  @override
  List<Object> get props => [];
}

final class CheckGlucoseOnTimeInitial extends CheckGlucoseOnTimeState {}

final class GlucoseWaitingTime extends CheckGlucoseOnTimeState {}

final class GlucoseChecking extends CheckGlucoseOnTimeState {}