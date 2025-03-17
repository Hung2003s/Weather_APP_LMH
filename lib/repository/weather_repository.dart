import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather.dart';

import '../model/chartdata.dart';

const baseUrl = 'https://api.open-meteo.com/v1/forecast';

//https://api.open-meteo.com/v1/forecast?latitude=21.05&longitude=105.7833&daily=weather_code,sunset,uv_index_max,rain_sum,precipitation_hours,sunrise,snowfall_sum,precipitation_sum,temperature_2m_max,precipitation_probability_max&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,temperature_1000hPa,relative_humidity_1000hPa&models=best_match&current=temperature_2m,wind_speed_10m,relative_humidity_2m,snowfall,precipitation,apparent_temperature,weather_code,wind_direction_10m,rain&forecast_hours=6&past_hours=6
class WeatherRepository {
  Future<Map<String, dynamic>> callAPI(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('---------------check ${response.body}');
      return jsonDecode(response.body);
    } else {
      print("Body: ${response.body}");
      throw Exception('Có lỗi trong quá trình lấy dữ liệu thời tiết');
    }
  }

  Future<Position?> getLocation() async {
    bool serviceEnable;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      return await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    } catch (e) {
      print("Error getting location or weather: $e");
      return null;
    }
  }

  Future<Weather> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    final String url =
        "${baseUrl}?latitude=$latitude&longitude=$longitude&daily=weather_code,sunset,uv_index_max,rain_sum,precipitation_hours,sunrise,snowfall_sum,precipitation_sum,temperature_2m_max,precipitation_probability_max&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,temperature_1000hPa,relative_humidity_1000hPa&models=best_match&current=temperature_2m,wind_speed_10m,relative_humidity_2m,snowfall,precipitation,apparent_temperature,weather_code,wind_direction_10m,rain&forecast_hours=6&past_hours=6";
    try {
      final jsonData = await callAPI(url);
      return Weather.fromJson(jsonData);
    } catch (e) {
      print("Lỗi trong quá trình fetchWeather: $e");
      throw Exception('Có lỗi trong quá trình lấy dữ liệu thời tiết');
    }
    // xu ly du lieu wind
  }

  Future<Weather> getCurrentLocationAndFetchWeather() async {
    Position? position = await getLocation();
    if (position != null) {
      return fetchWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } else {
      print("Không lấy được vị trí, sử dụng tọa độ mặc định.");
      return fetchWeather(
        latitude: 21.0285, // Hà Nội (mặc định)
        longitude: 105.8048, // Hà Nội (mặc định)
      );
    }
  }

  //xu ly thoi gian
  String convertTimeFormattoH(String inputTime) {
    // 1. Parse chuỗi thời gian đầu vào thành đối tượng DateTime
    DateTime dateTime = DateTime.parse(inputTime);
    // 2. Định dạng đối tượng DateTime thành chuỗi giờ:phút (HH:mm)
    String formattedTime = DateFormat("H'h'").format(dateTime);
    // 3. Trả về chuỗi thời gian đã định dạng
    return formattedTime;
  }

  Future<List<ChartData>> processWeatherDataForChart(Weather weather, String datatype) async {
    List<ChartData> dataPoints = [];
    final hourly = weather.hourly;
    if (hourly != null && hourly.time != null ) {
      List<num>? dataList;
      String unit = '';
      switch (datatype) {
        case 'windSpeed10M':
          dataList = hourly.windSpeed10M;
          unit = 'Km/h'; // Hoặc 'm/s' tùy thuộc vào API
          break;
        case 'snowfall':
          dataList = hourly.snowfall;
          unit = 'cm'; // Hoặc 'mm' tùy thuộc vào API
          break;
        case 'precipitation':
          dataList = hourly.precipitationProbability;
          unit = 'mm';
          break;
      // Thêm các case khác cho các loại dữ liệu khác (ví dụ: temperature2M, relativeHumidity2M, v.v.)
        default:
          print('Loại dữ liệu không được hỗ trợ: $datatype');
          return dataPoints;
      }
      if(dataList != null) {
        for (int i = 0; i < hourly.time.length; i++) {
          String formattedTime = convertTimeFormattoH(hourly.time[i]);
          final value = dataList[i]?.toDouble();
          dataPoints.add(ChartData(
            formattedTime,
            value!,
          ));
        }
      }

    }
    return dataPoints;
  }
}
