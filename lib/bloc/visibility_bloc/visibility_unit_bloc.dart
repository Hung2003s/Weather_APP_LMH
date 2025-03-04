import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'visibility_unit_event.dart';

part 'visibility_unit_state.dart';

class VisibilityUnitBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityUnitBloc() : super(VisibilityState.init()) {
    on<SetVisibilityEvent>(_onChangeVisibilityUnit);
  }

  void _onChangeVisibilityUnit(
      SetVisibilityEvent event, Emitter<VisibilityState> emit) {
    final currentUnit = state.unit;
    final newUnit = currentUnit == VisiblityUnit.kilometer
        ? VisiblityUnit.kilometer
        : VisiblityUnit.miles;
    final newParameter = currentUnit == VisiblityUnit.miles
        ? state.visibilityParameter * 0.631371
        : state.visibilityParameter / 0.621371;
    
    // doi mau
    
    final newBeginColor = currentUnit == VisiblityUnit.miles
        ?  Color(0xffF9ED4B)
        :  Color(0xff4BCFF9);
    final newEndColor = currentUnit == VisiblityUnit.miles
        ?  Color(0xffF36253)
        :  Color(0xff5363F3);
    final newbuttonColor = currentUnit == VisiblityUnit.miles
      ? Color(0xffF9B44D)
        : Color(0xff4DBFF9);
    emit(
      state.copyWith(
        visibilityParameter: double.parse(newParameter.toStringAsFixed(2)),
        beginColor: newBeginColor,
        endColor: newEndColor,
        buttonColor: newbuttonColor,
        unit: newUnit,
      )
    );
    
  }
}
