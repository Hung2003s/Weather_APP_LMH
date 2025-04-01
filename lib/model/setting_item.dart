class SettingItem {
   String _title;
   String _image;
   bool _acronym;
   bool _isCelsius;
   bool _isTemper;
   String _linkSetting;


   SettingItem(this._title, this._image, this._isTemper,this._acronym, this._isCelsius,this._linkSetting );

   bool get isCelcius => _isCelsius;

  set isCelcius(bool value) {
    _isCelsius = value;
  }

  bool get acronym => _acronym;

  set acronym(bool value) {
    _acronym = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

   bool get istemper => _isTemper;

  set istemper(bool value) {
    _isTemper = value;
  }

   String get linksetting => _linkSetting;

  set linksetting(String value) {
    _linkSetting = value;
  }
}
