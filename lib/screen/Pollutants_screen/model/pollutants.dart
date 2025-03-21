class Pollutants {
  String _name;
  int _value;
  int _color;
  int _textcolor;

  Pollutants(this._name, this._value, this._color, this._textcolor);

  int get textcolor => _textcolor;

  set textcolor(int value) {
    _textcolor = value;
  }

  int get color => _color;

  set color(int value) {
    _color = value;
  }

  int get value => _value;

  set value(int value) {
    _value = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}