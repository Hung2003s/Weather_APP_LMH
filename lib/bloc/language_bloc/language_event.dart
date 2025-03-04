part of 'language_bloc.dart';


sealed class LanguageEvent extends Equatable{
  const LanguageEvent();

}
final class SetAcronymEvent extends LanguageEvent {
  final String languageAcronym;
  const SetAcronymEvent({
    required this.languageAcronym,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [languageAcronym];
}