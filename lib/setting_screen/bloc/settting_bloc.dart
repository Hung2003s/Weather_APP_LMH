import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/setting_screen/bloc/setting_event.dart';
import 'package:weatherapp/setting_screen/bloc/setting_state.dart';


class TemperatureUnitBloc extends Bloc<TemperatureUnitEvent, TemperatureUnitState> {
  TemperatureUnitBloc() : super(const TemperatureUnitState(unit: TemperatureUnit.celsius)) {
    on<ToggleTemperatureUnit>(_onToggleTemperatureUnit);
  }

  void _onToggleTemperatureUnit(ToggleTemperatureUnit event, Emitter<TemperatureUnitState> emit) {
    final currentUnit = state.unit;
    final newUnit = currentUnit == TemperatureUnit.celsius
        ? TemperatureUnit.fahrenheit
        : TemperatureUnit.celsius;
    emit(TemperatureUnitState(unit: newUnit));
  }
}