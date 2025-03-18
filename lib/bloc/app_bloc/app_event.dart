part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}
//app
final class SetLocationEvent extends AppEvent {
  SetLocationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];


}
final class FetchDataEvent extends AppEvent {
  final double latitude;
  final double longitude;

  FetchDataEvent(this.latitude, this.longitude);

  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude];
}

final class AddWeather extends AppEvent {
  final Weather weather;

  AddWeather(this.weather);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//language
final class SetAcronymEvent extends AppEvent {
  final String languageAcronym;
  const SetAcronymEvent({
    required this.languageAcronym,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [languageAcronym];
}

//setting
class ToggleTemperatureUnit extends AppEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SetThemeEvent extends AppEvent {
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
//visibility

class SetVisibilityParamEvent extends AppEvent {
  final double latitude;
  final double longitude;
  SetVisibilityParamEvent({ required this.latitude, required this.longitude,});

  @override
  // TODO: implement props
  List<Object?> get props => [
    latitude,
    longitude,
  ];
}
class SetVisibilityEvent extends AppEvent {
  final Color beginColor;
  final Color endColor;
  final Color buttonColor;
  final double visibilitParameter;
  final VisibilityUnit visibilityUnit;

  const SetVisibilityEvent( {
    required this.beginColor,
    required this.endColor,
    required this.buttonColor,
    required this.visibilitParameter,
    required this.visibilityUnit
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw [
    // visibilityUnit,
    // beginColor,
    // endColor,
    // visibilitParameter,
    // buttonColor
  ];
}

class SetDataToChartEvent extends AppEvent {
  final List<ChartData> chartData;
  SetDataToChartEvent(this.chartData);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}