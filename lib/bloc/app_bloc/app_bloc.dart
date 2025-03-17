

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import '../../model/weather.dart';
import '../../screen/language_screen/controller/language_controller.dart';
import '../../screen/theme_screen/controller/theme_controller.dart';
import '../../screen/therometer_screen/controller/thermometer_controller.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetLocationandFetchDataEvent>(_onSetAppLocationandFetchData);
    //Language
    on<SetAcronymEvent>(_onSetAcronym);
    //Setting
    on<SetThemeEvent>(_onChangeThemeImage);
    on<SetThermometerEvent>(_onChangeThermometerImage);
    on<ToggleTemperatureUnit>(_onToggleTemperatureUnit);

    //Visibility
    on<SetVisibilityEvent>(_onChangeVisibilityUnit);
    on<SetVisibilityParamEvent>(_onSetVisibilityParam);
  }

  // app state
  void _onSetAppLocationandFetchData(SetLocationandFetchDataEvent event, Emitter<AppState> emit) async {

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

      final WeatherRepository weatherRepository = WeatherRepository();
      //   final Weather data = await weatherRepository.fetchWether(
      //     latitude: state.latitude,
      //     longitude: state.longitude,
      //   );


      emit(state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
      ));
    } catch (e) {
      print("Error getting location or weather: $e");
    }
    // fetch Data
    // try {
    //   print('Fetching Data');
    //   emit(state.copyWith(loadingState: LoadingState.loading));
    //   final WeatherRepository weatherRepository = WeatherRepository();
    //   final Weather data = await weatherRepository.fetchWether(
    //     latitude: state.latitude,
    //     longitude: state.longitude,
    //   );
    //   emit(state.copyWith(
    //       weather: data,
    //       loadingState: LoadingState.finished));
    // } catch (e) {
    //   print("Error getting location or weather: $e");
    // }
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
      SetVisibilityEvent event, Emitter<AppState> emit)
  {
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
    ) );
  }

  void _onSetVisibilityParam(
      SetVisibilityParamEvent event, Emitter<AppState> emit) async
  {
    try {
      print('Fetching Data');
      emit(state.copyWith(loadingState: LoadingState.loading));
      final WeatherRepository weatherRepository = WeatherRepository();
      final Weather data = await weatherRepository.fetchWeather(
        latitude: event.latitude,
        longitude: event.longitude,
      );
      emit(state.copyWith(weather: data,loadingState: LoadingState.finished));
    } catch (e) {
      print("Error getting location or weather: $e");
    }
  }


}
