import 'dart:ui';

class ChartData {
String _month;
double _value;
Color _color;

ChartData(this._month, this._value, this._color);


Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  double get value => _value;

  set value(double value) {
    _value = value;
  }

  String get month => _month;

  set month(String value) {
    _month = value;
  }
}