import 'package:equatable/equatable.dart';

class SettingState extends Equatable {
  final String isTemperature;
  final String isLanguage;

  SettingState(this.isTemperature, this.isLanguage);

  @override
  // TODO: implement props
  List<Object?> get props => [isTemperature];

}