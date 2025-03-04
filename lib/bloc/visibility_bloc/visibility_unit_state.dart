part of 'visibility_unit_bloc.dart';

enum VisiblityUnit { kilometer, miles }

class VisibilityState extends Equatable {
  final VisiblityUnit unit;
  final Color beginColor; // Màu bắt đầu gradient của CirclePage
  final Color endColor; // Màu kết thúc gradient của CirclePage
  final Color buttonColor; // Màu của VisibilityButton
  final double visibilityParameter;

  VisibilityState(
      {required this.unit,
      required this.beginColor,
      required this.endColor,
      required this.buttonColor,
      required this.visibilityParameter});

  factory VisibilityState.init() {
    return VisibilityState(
        unit: VisiblityUnit.kilometer,
        beginColor: Color(0xff4BCFF9),
        endColor: Color(0xff5363F3),
        buttonColor: Color(0xff4DBFF9),
        visibilityParameter: 0.0);
  }
  VisibilityState copyWith({
    VisiblityUnit? unit,
    Color? beginColor, // Màu bắt đầu gradient của CirclePage
     Color? endColor,// Màu kết thúc gradient của CirclePage
     Color? buttonColor, // Màu của VisibilityButton
     double? visibilityParameter,
}) {
    return VisibilityState(
        unit: unit ?? this.unit,
        beginColor: beginColor ?? this.beginColor,
        endColor: endColor ?? this.endColor,
        buttonColor: buttonColor ?? this.buttonColor,
        visibilityParameter: visibilityParameter ?? this.visibilityParameter);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    unit,
    beginColor,
    endColor,
    buttonColor,
    visibilityParameter
  ];
}
