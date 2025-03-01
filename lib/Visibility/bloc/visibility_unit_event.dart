part of 'visibility_unit_bloc.dart';

abstract class VisibilityUnitEvent extends Equatable {
  const VisibilityUnitEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ToggleVisibilityUnit extends VisibilityUnitEvent {}