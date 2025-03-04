part of 'app_bloc.dart';

final class AppState extends Equatable {
  final String theme;
  final String thermometer;
  final double latitude;
  final double longitude;

  AppState({
    required this.thermometer,
    required this.theme,
    required this.latitude,
    required this.longitude,
  });

  factory AppState.init() {
    return AppState(
        thermometer: ThermometerController().listThermometers.first,
        theme: ThemeController().listThemeItem.first,
        latitude: 0.0,
        longitude: 0.0);
  }

  AppState copyWith({
    String? theme,
    String? thermometer,
    double? latitude,
    double? longitude,
  }) {
    return AppState(
      thermometer: thermometer ?? this.thermometer,
      theme: theme ?? this.theme,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object> get props => [
        theme,
        thermometer,
        latitude,
        longitude,
      ];
}
