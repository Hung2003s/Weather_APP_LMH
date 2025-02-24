import 'dart:ui';

class Appservice {
  String _name;
  String _logo;
  int _color;
  String _link;


  Appservice(this._name, this._logo, this._color, this._link);


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

  String get link => _link;

  set link(String value) {
    _link = value;
  }


}