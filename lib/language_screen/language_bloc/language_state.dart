
part of 'language_bloc.dart';

final class LanguageState extends Equatable {
  final String acronym;


  LanguageState({required this.acronym});

  factory LanguageState.init() {
    return LanguageState(acronym: LanguageController().listacronym.first);
  }

  LanguageState copyWith({String? acronym}) {
    return LanguageState(
       acronym: acronym ?? this.acronym);
  }
  @override
  List<Object> get props => [acronym];
}

