import 'dart:ui';

class Appservice {
  String _name;
  String _logo;
  int _color;


  Appservice(this._name, this._logo, this._color);


  int get color => _color;

  set color(int value) {
    _color = value;
  }

  String get logo => _logo;

  set logo(String value) {
    _logo = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}