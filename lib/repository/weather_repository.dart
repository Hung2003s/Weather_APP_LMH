import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather.dart';

class OpenMeteoService {
  Future<Daily> getDaily({
    required double latitude,
    required double longitude,
  }) async {
    final String baseUrl = 'https://api.open-meteo.com/v1/forecast';

     // final String url =
     //     '$baseUrl?latitude=$latitude&longitude=$longitude&daily';

    final String url = "$baseUrl?latitude=$latitude&longitude=$longitude&current=snowfall,weather_code&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,uv_index_clear_sky&daily=weather_code,sunrise,sunset,uv_index_max,precipitation_sum,snowfall_sum&timezone=auto";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Daily.fromJson(jsonDecode(response.body));
    } else {
      print("Body: ${response.body}");
      throw Exception(
          'Failed to load weather data: ${response.statusCode}, ${response.body}');
    }
  }

  Future<Hourly> getHourly({
    required double latitude,
    required double longitude,
}) async {
    final String baseUrl = 'https://api.open-meteo.com/v1/forecast';
    final String url = "$baseUrl?latitude=$latitude&longitude=$longitude&current=snowfall,weather_code&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,uv_index_clear_sky&daily=weather_code,sunrise,sunset,uv_index_max,precipitation_sum,snowfall_sum&timezone=auto";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Hourly.fromJson(jsonDecode(response.body));
    } else {
      print("Body: ${response.body}");
      throw Exception(
          'Failed to load weather data: ${response.statusCode}, ${response.body}');
    }
  }
}
