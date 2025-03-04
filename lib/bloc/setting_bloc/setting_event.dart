import 'package:equatable/equatable.dart';

abstract class TemperatureUnitEvent extends Equatable {
  const TemperatureUnitEvent();

  @override
  List<Object> get props => [];
}

class ToggleTemperatureUnit extends TemperatureUnitEvent {}