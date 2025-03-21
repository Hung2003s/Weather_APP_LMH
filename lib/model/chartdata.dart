class ChartData {
  String _xvalue;
  double _yvalue;

  ChartData(
    this._xvalue,
    this._yvalue,
  );

  double get yvalue => _yvalue;

  set yvalue(double value) {
    _yvalue = value;
  }

  String get xvalue => _xvalue;

  set xvalue(String value) {
    _xvalue = value;
  }
}
