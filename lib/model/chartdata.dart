class ChartData {
  String _xValue;
  double _yValue;

  ChartData(
    this._xValue,
    this._yValue,
  );

  double get yvalue => _yValue;

  set yvalue(double value) {
    _yValue = value;
  }

  String get xvalue => _xValue;

  set xvalue(String value) {
    _xValue = value;
  }
}
