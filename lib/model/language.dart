class Language {
  String _name;
  String _logo;


  Language(this._name, this._logo);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get logo => _logo;

  set logo(String value) {
    _logo = value;
  }

  @override
  String toString() {
    return 'Language{_logo: $_logo, _name: $_name}';
  }
}