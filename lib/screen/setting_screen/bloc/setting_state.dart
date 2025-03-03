import 'package:equatable/equatable.dart';

enum TemperatureUnit { celsius, fahrenheit }

class TemperatureUnitState extends Equatable {
  final TemperatureUnit unit;

  const TemperatureUnitState({required this.unit});

  @override
  List<Object> get props => [unit];
}