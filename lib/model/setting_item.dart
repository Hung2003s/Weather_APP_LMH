class SettingItem {
   String _title;
   String _image;
   bool _acronym;
   bool _isCelcius;
   bool _istemper;
   String _linksetting;


   SettingItem(this._title, this._image, this._istemper,this._acronym, this._isCelcius,this._linksetting );

   bool get isCelcius => _isCelcius;

  set isCelcius(bool value) {
    _isCelcius = value;
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

   bool get istemper => _istemper;

  set istemper(bool value) {
    _istemper = value;
  }

   String get linksetting => _linksetting;

  set linksetting(String value) {
    _linksetting = value;
  }
}
