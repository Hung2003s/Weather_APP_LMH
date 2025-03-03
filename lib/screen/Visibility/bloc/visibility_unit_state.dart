part of 'visibility_unit_bloc.dart';

enum VisiblityUnit {kilometer, miles }
 class VisibilityUnitState extends Equatable {
  final VisiblityUnit unit;

  VisibilityUnitState({ required this.unit});

  @override
  // TODO: implement props
  List<Object?> get props => [unit];

}

