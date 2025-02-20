class SettingItem {
   String _title;
   String _image;
   String _acronym;

  SettingItem(this._title, this._image, this._acronym);

  String get acronym => _acronym;

  set acronym(String value) {
    _acronym = value;
  }

  String get imgae => _image;

  set imgae(String value) {
    _image = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

   @override
  String toString() {
    return 'SettingItem{_title: $_title, _imgae: $_image, _acronym: $_acronym}';
  }
}
