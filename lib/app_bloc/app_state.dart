part of 'app_bloc.dart';

final class AppState extends Equatable {
  final String theme;
  final String thermometer;
  AppState({
    required this.thermometer,
    required this.theme
  });

  factory AppState.init() {
    return AppState(
        thermometer:ThermometerController().listThermometers.first,
        theme:ThemeController().listThemeItem.first,
    );
  }

  AppState copyWith({String? theme, String? thermometer}) {
    return AppState(
        thermometer: thermometer ?? this.thermometer,
        theme: theme ?? this.theme);
  }
  @override
  List<Object> get props => [theme, thermometer];
}
