import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import '../../model/chartdata.dart';
import '../../model/weather.dart';
import '../../screen/language_screen/controller/language_controller.dart';
import '../../screen/theme_screen/controller/theme_controller.dart';
import '../../screen/therometer_screen/controller/thermometer_controller.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetLocationEvent>(_onSetAppLocation);
    on<FetchDataEvent>(_onFetchData);
    on<AddWeather>(_onAddWeather);
    //Language
    on<SetAcronymEvent>(_onSetAcronym);
    //Setting
    on<SetThemeEvent>(_onChangeThemeImage);
    on<SetThermometerEvent>(_onChangeThermometerImage);
    on<ToggleTemperatureUnit>(_onToggleTemperatureUnit);

    //Visibility
    on<SetVisibilityEvent>(_onChangeVisibilityUnit);
    on<SetVisibilityParamEvent>(_onSetVisibilityParam);

    //chartData
    on<SetDataToChartEvent>(_onLoadDataToChart);
  }


  // app state
  void _onSetAppLocation(SetLocationEvent event, Emitter<AppState> emit) async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Dịch vụ vị trí bị tắt');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Quyền truy cập bị từ chối');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
      emit(state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
      ));
    } catch (e) {
      print("Error getting location or weather: $e");
    }
  }

  //fetch Data
  void _onFetchData(FetchDataEvent event, Emitter<AppState> emit) async {
    WeatherRepository weatherRepository = WeatherRepository();
    final String url =
        "${baseUrl}?latitude=${state.latitude}&longitude=${state.longitude}&daily=weather_code,sunset,uv_index_max,rain_sum,precipitation_hours,sunrise,snowfall_sum,precipitation_sum,temperature_2m_max,precipitation_probability_max&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,temperature_1000hPa,relative_humidity_1000hPa&models=best_match&current=temperature_2m,wind_speed_10m,relative_humidity_2m,snowfall,precipitation,apparent_temperature,weather_code,wind_direction_10m,rain&forecast_hours=6&past_hours=6";
    try {
      final jsonData = await weatherRepository.callAPI(url);
      print('Data fetched successfully: $jsonData');
      emit(state.copyWith(
          weather: Weather.fromJson(jsonData),
          loadingState: LoadingState.finished));
      print('State updated to finished');
    } catch (e) {
      print("Lỗi trong quá trình fetchWeather: $e");
      throw Exception('Có lỗi trong quá trình lấy dữ liệu thời tiết');
    }
  }

  void _onAddWeather(AddWeather event, Emitter<AppState> emit) async {
    emit(state.copyWith(weather: event.weather));
  }

  // language
  void _onSetAcronym(SetAcronymEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(acronym: event.languageAcronym));
  }

  //Setting
  void _onToggleTemperatureUnit(
      ToggleTemperatureUnit event, Emitter<AppState> emit) {
    final currentUnit = state.tempunit;
    final newUnit = currentUnit == TemperatureUnit.celsius
        ? TemperatureUnit.fahrenheit
        : TemperatureUnit.celsius;
    final newtempParameter = currentUnit == TemperatureUnit.celsius
        ? (state.tempParameter) * 1.8 + 32 //doi sang do F
        : (state.tempParameter - 32) * 5 / 9;
    emit(state.copyWith(tempunit: newUnit, tempParameter: newtempParameter));
  }

  void _onChangeThemeImage(SetThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.imageTheme));
  }

  void _onChangeThermometerImage(
      SetThermometerEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(thermometer: event.imageThermometer));
  }

  //visibility

  void _onChangeVisibilityUnit(
      SetVisibilityEvent event, Emitter<AppState> emit) {
    final currentUnit = state.visibilityUnit;
    final newUnit = currentUnit == VisibilityUnit.kilometer
        ? VisibilityUnit.miles
        : VisibilityUnit.kilometer;
    final newParameter = currentUnit == VisibilityUnit.kilometer
        ? state.visibilityParameter * 0.62137199
        : state.visibilityParameter / 0.62137199;

    final newBeginColor = currentUnit == VisibilityUnit.kilometer
        ? Color(0xffF9ED4B)
        : Color(0xff4BCFF9);
    final newEndColor = currentUnit == VisibilityUnit.kilometer
        ? Color(0xffF36253)
        : Color(0xff5363F3);
    final newbuttonColor = currentUnit == VisibilityUnit.kilometer
        ? Color(0xffF9B44D)
        : Color(0xff4DBFF9);
    emit(state.copyWith(
      visibilityParameter: double.parse(newParameter.toStringAsFixed(2)),
      beginColor: newBeginColor,
      endColor: newEndColor,
      buttonColor: newbuttonColor,
      visibilityUnit: newUnit,
    ));
  }

  void _onSetVisibilityParam(
      SetVisibilityParamEvent event, Emitter<AppState> emit) async {
    try {
      print('Fetching Data');
      emit(state.copyWith(loadingState: LoadingState.loading));
      final WeatherRepository weatherRepository = WeatherRepository();
      final Weather data = await weatherRepository.fetchWeather(
        latitude: event.latitude,
        longitude: event.longitude,
      );
      emit(state.copyWith(weather: data, loadingState: LoadingState.finished));
    } catch (e) {
      print("Error getting location or weather: $e");
    }
  }


  //chartData

  void _onLoadDataToChart(SetDataToChartEvent event, Emitter<AppState> emit) async {
    List<ChartData> dataPoints = [];
    final hourly = state.weather?.hourly;
    {
      List<num>? dataList;
      //String unit = '';
      switch (state.dataType) {
        case 'windSpeed10M':
          dataList = hourly?.windSpeed10M;
          // unit = 'Km/h'; // Hoặc 'm/s' tùy thuộc vào API
          break;
        case 'snowfall':
          dataList = hourly?.snowfall;
          // unit = 'cm'; // Hoặc 'mm' tùy thuộc vào API
          break;
        case 'precipitation':
          dataList = hourly?.precipitationProbability;
          // unit = 'mm';
          break;
      // Thêm các case khác cho các loại dữ liệu khác (ví dụ: temperature2M, relativeHumidity2M, v.v.)
        default:
          print('Loại dữ liệu không được hỗ trợ: ${state.dataType}');
          emit(state.copyWith(
            chartData: dataPoints
          ));
      }
      // if(dataList != null) {
      for (int i = 0; i < hourly!.time.length; i++) {
        String formattedTime = convertTimeFormattoH(hourly.time[i]);
        final value = dataList?[i].toDouble();
        dataPoints.add(ChartData(
          formattedTime,
          value!,
        ));
      }
      //  }

    }
  }
  String convertTimeFormattoH(String inputTime) {
    // 1. Parse chuỗi thời gian đầu vào thành đối tượng DateTime
    DateTime dateTime = DateTime.parse(inputTime);
    // 2. Định dạng đối tượng DateTime thành chuỗi giờ:phút (HH:mm)
    String formattedTime = DateFormat("H'h'").format(dateTime);
    // 3. Trả về chuỗi thời gian đã định dạng
    return formattedTime;
  }
}
