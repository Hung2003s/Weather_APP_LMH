class ChartData {
  String _xValue;
  double _yValue;

  ChartData(
    this._xValue,
    this._yValue,
  );

  double get yValue => _yValue;

  set yValue(double value) {
    _yValue = value;
  }

  String get xValue => _xValue;

  set xValue(String value) {
    _xValue = value;
  }
}
