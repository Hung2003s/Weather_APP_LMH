part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

final class SetThemeEvent extends AppEvent {
  final String imageTheme;

  const SetThemeEvent({
    required this.imageTheme,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [imageTheme];
}

final class SetThermometerEvent extends AppEvent {
  final String imageThermometer;

  SetThermometerEvent({required this.imageThermometer});

  @override
  // TODO: implement props
  List<Object?> get props => [imageThermometer];
}

final class SetLocationEvent extends AppEvent {
  final double latitude;
  final double longitude;

  SetLocationEvent({required this.latitude, required this.longitude});

  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude];
}
