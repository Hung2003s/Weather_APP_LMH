part of 'app_bloc.dart';

enum LoadingState {
  pure,
  loading,
  finished,
  error,
}

enum TemperatureUnit { celsius, fahrenheit }

enum VisibilityUnit { kilometer, miles }

final class AppState extends Equatable {
  //app
  final double latitude;
  final double longitude;
  final Weather? weather;
  LoadingState loadingState;

  // language
  final String acronym;

  // setting
  final TemperatureUnit tempunit;
  final double tempParameter;
  final String theme;
  final String thermometer;

  //visibility
  final VisibilityUnit visibilityUnit;
  final Color beginColor; //Màu bat dau gradient của CirclePage
  final Color endColor; // Màu kết thúc gradient của CirclePage
  final Color buttonColor; // Màu của VisibilityButton
  final double visibilityParameter;


  //chart data
  final List<ChartData> chartData;
  final String dataType;



  AppState( {
    this.loadingState = LoadingState.pure,
    required this.latitude,
    required this.longitude,
    this.weather,

    //language
    required this.acronym,

    //setting
    required this.tempunit,
    required this.tempParameter,
    required this.theme,
    required this.thermometer,

    //visibility
    required this.visibilityUnit,
    required this.beginColor,
    required this.endColor,
    required this.buttonColor,
    required this.visibilityParameter,


    //uv index
    required this.chartData,
    required this.dataType,



  });

  factory AppState.init() {
    return AppState(
        latitude: 0.0,
        longitude: 0.0,
        loadingState: LoadingState.loading,
        //language
        acronym: LanguageController().listacronym.first,

        //setting
        tempunit: TemperatureUnit.celsius,
        tempParameter: 0.0,
        theme: ThemeController().listThemeItem.first,
        thermometer: ThermometerController().listThermometers.first,

        //visibility
        visibilityUnit: VisibilityUnit.kilometer,
        beginColor: Color(0xff4BCFF9),
        endColor: Color(0xff5363F3),
        buttonColor: Color(0xff4DBFF9),
        visibilityParameter: 5.0,
        chartData: [],
        dataType: ''
    );
  }

  AppState copyWith({
    double? latitude,
    double? longitude,
    LoadingState? loadingState,
    Weather? weather,

    // language
    String? acronym,

    //setting
    TemperatureUnit? tempunit,
    double? tempParameter,
    String? theme,
    String? thermometer,

    // visibility
    VisibilityUnit? visibilityUnit,
    Color? beginColor, // Màu bắt đầu gradient của CirclePage
    Color? endColor, // Màu kết thúc gradient của CirclePage
    Color? buttonColor, // Màu của VisibilityButton
    double? visibilityParameter,
    List<ChartData>? chartData,
    String? dataType,
  }) {
    return AppState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      weather: weather ?? this.weather,
      loadingState: loadingState ?? this.loadingState,

      //language
      acronym: acronym ?? this.acronym,
      //setting
      tempunit: tempunit ?? this.tempunit,
      tempParameter: tempParameter ?? this.tempParameter,
      theme: theme ?? this.theme,
      thermometer: thermometer ?? this.thermometer,

      //visibility
      visibilityUnit: visibilityUnit ?? this.visibilityUnit,
      beginColor: beginColor ?? this.beginColor,
      endColor: endColor ?? this.endColor,
      buttonColor: buttonColor ?? this.buttonColor,
      visibilityParameter: visibilityParameter ?? this.visibilityParameter,
      chartData: chartData ?? this.chartData,
      dataType: dataType ?? this.dataType,


    );
  }

  @override
  List<Object?> get props => [
        //app
        latitude, longitude, loadingState, weather,
        //language
        acronym,
        //setting
        tempunit, tempParameter, thermometer, theme,

        //visibility
        visibilityUnit, beginColor, endColor, buttonColor, visibilityParameter,

        //chartData
        chartData,dataType
      ];
}
