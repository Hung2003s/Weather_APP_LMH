import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/router/router.dart';
import 'package:weatherapp/theme_screen/controller/theme_controller.dart';
import 'package:weatherapp/therometer_screen/controller/thermometer_controller.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.init()) {
    on<SetThemeEvent>(_onChangeThemeImage);
    on<SetThermometerEvent>(_onChangeThermometerImage);
  }
  void _onChangeThemeImage(SetThemeEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.imageTheme));
  }

  void _onChangeThermometerImage(SetThermometerEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(thermometer: event.imageThermometer));
  }
}
