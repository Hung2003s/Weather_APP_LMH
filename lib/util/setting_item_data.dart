
import '../model/setting_item.dart';
import '../router/router.dart';

final List<SettingItem> listSettingItem = [
  SettingItem('Thermometers', 'assets/images/settingimage/thermometer.png',false,false,false ,AppRouter.thermometerPath),
  SettingItem('Temperature', 'assets/images/settingimage/temperature.png', true, false, true,''),
  SettingItem('Themes', 'assets/images/settingimage/themes.png', false, false, false,AppRouter.themePath),
  SettingItem('Language', 'assets/images/settingimage/language.png', false,true,false,AppRouter.languagePath),
  SettingItem('Modify my consent', 'assets/images/settingimage/modifymyconsent.png', false, false, false,''),
  SettingItem('Term of Condition', 'assets/images/settingimage/terms.png', false, false, false,''),
  SettingItem('Privacy', 'assets/images/settingimage/privacy.png', false, false, false,''),
  SettingItem('Contact us', 'assets/images/settingimage/contact.png', false, false, false,''),
  SettingItem('Share app', 'assets/images/settingimage/share.png', false, false, false,''),

];