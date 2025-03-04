part of 'visibility_unit_bloc.dart';

abstract class VisibilityEvent extends Equatable {
  const VisibilityEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetVisibilityEvent extends VisibilityEvent {
  final Color beginColor;
  final Color endColor;
  final Color buttonColor;
  final double visibilitParameter;
  final VisiblityUnit unit;

  const SetVisibilityEvent( {
    required this.beginColor,
    required this.endColor,
    required this.buttonColor,
    required this.visibilitParameter,
    required this.unit
  });
}
