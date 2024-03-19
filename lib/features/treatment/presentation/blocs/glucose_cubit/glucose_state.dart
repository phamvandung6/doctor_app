part of 'glucose_cubit.dart';

sealed class GlucoseState extends Equatable {
  const GlucoseState();

  @override
  List<Object> get props => [];
}

final class GlucoseInitial extends GlucoseState {}

final class GlucoseLow extends GlucoseState {}

final class GlucoseHigh extends GlucoseState {}

final class GlucoseMedium extends GlucoseState {}
