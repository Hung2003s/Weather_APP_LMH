import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather.dart';



const baseUrl = 'https://api.open-meteo.com/v1/forecast';

class WeatherRepository {


  Future<Weather> fetchWether({
    required double latitude,
    required double longitude,
  }) async {
    final String url = "${baseUrl}?latitude=21.0245&longitude=105.8412&current=temperature_2m,relative_humidity_2m,precipitation,snowfall,weather_code&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,snowfall,weather_code,wind_speed_10m,temperature_1000hPa,relative_humidity_1000hPa,wind_speed_1000hPa&daily=weather_code,sunrise,sunset,uv_index_max,precipitation_sum,snowfall_sum&timezone=Asia%2FBangkok&past_hours=6&forecast_hours=1&cell_selection=nearest&models=best_match";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('---------------check ${response.body}');
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      print("Body: ${response.body}");
      throw Exception('Có lỗi trong quá trình lấy dữ liệu thời tiết');
    }
  }
}
