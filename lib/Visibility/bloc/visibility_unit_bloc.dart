import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'visibility_unit_event.dart';
part 'visibility_unit_state.dart';

class VisibilityUnitBloc extends Bloc<VisibilityUnitEvent, VisibilityUnitState> {
  VisibilityUnitBloc() : super(VisibilityUnitState(unit: VisiblityUnit.kilometer)) {
    on<ToggleVisibilityUnit>(_onChangeVisibilityUnit);
  }

  void _onChangeVisibilityUnit(ToggleVisibilityUnit event, Emitter<VisibilityUnitState> emit) {
    final currentUnit = state.unit;
    final newUnit = currentUnit == VisiblityUnit.kilometer
        ? VisiblityUnit.kilometer
        : VisiblityUnit.miles;
    emit(VisibilityUnitState(unit: newUnit));
}
}
