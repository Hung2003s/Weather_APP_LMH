import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../screen/theme_screen/controller/theme_controller.dart';
import '../../screen/therometer_screen/controller/thermometer_controller.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetThemeEvent>(_onChangeThemeImage);
    on<SetThermometerEvent>(_onChangeThermometerImage);
    on<SetLocationEvent>(_onSetAppLocation);
  }

  void _onChangeThemeImage(SetThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.imageTheme));
  }

  void _onChangeThermometerImage(
      SetThermometerEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(thermometer: event.imageThermometer));
  }

  void _onSetAppLocation(SetLocationEvent event, Emitter<AppState> emit) async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Dịch vụ vị trí bị tắt');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    ;
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
      emit(state.copyWith(
        latitude: 21.0285,
        longitude: 21.0285,
      ));
    }
  }
}
