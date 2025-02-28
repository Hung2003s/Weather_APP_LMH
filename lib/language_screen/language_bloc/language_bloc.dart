import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/language_screen/controller/language_controller.dart';

import '../model/language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState.init()) {
    on<SetAcronymEvent>(_onSetAcronym);

  }
  void _onSetAcronym(SetAcronymEvent event, Emitter<LanguageState> emit) {
    emit(state.copyWith(acronym: event.languageAcronym));
  }



}

