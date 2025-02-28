import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  final int? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final int? elevation;
  final CurrentUnits? currentUnits;
  final Current? current;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      currentUnits: json["current_units"] == null ? null : CurrentUnits.fromJson(json["current_units"]),
      current: json["current"] == null ? null : Current.fromJson(json["current"]),
      hourlyUnits: json["hourly_units"] == null ? null : HourlyUnits.fromJson(json["hourly_units"]),
      hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      dailyUnits: json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }

  @override
  List<Object?> get props => [
    latitude, longitude, generationtimeMs, utcOffsetSeconds, timezone, timezoneAbbreviation, elevation, currentUnits, current, hourlyUnits, hourly, dailyUnits, daily, ];
}

class Current extends Equatable {
  Current({
    required this.time,
    required this.interval,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final int? interval;
  final int? snowfall;
  final int? weatherCode;

  factory Current.fromJson(Map<String, dynamic> json){
    return Current(
      time: json["time"],
      interval: json["interval"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  @override
  List<Object?> get props => [
    time, interval, snowfall, weatherCode, ];
}

class CurrentUnits extends Equatable {
  CurrentUnits({
    required this.time,
    required this.interval,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final String? interval;
  final String? snowfall;
  final String? weatherCode;

  factory CurrentUnits.fromJson(Map<String, dynamic> json){
    return CurrentUnits(
      time: json["time"],
      interval: json["interval"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  @override
  List<Object?> get props => [
    time, interval, snowfall, weatherCode, ];
}

class Daily extends Equatable {
  Daily({
    required this.time,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
    required this.precipitationSum,
    required this.snowfallSum,
  });

  final List<DateTime> time;
  final List<int> weatherCode;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> uvIndexMax;
  final List<int> precipitationSum;
  final List<int> snowfallSum;

  factory Daily.fromJson(Map<String, dynamic> json){
    return Daily(
      time: json["time"] == null ? [] : List<DateTime>.from(json["time"]!.map((x) => DateTime.tryParse(x ?? ""))),
      weatherCode: json["weather_code"] == null ? [] : List<int>.from(json["weather_code"]!.map((x) => x)),
      sunrise: json["sunrise"] == null ? [] : List<String>.from(json["sunrise"]!.map((x) => x)),
      sunset: json["sunset"] == null ? [] : List<String>.from(json["sunset"]!.map((x) => x)),
      uvIndexMax: json["uv_index_max"] == null ? [] : List<double>.from(json["uv_index_max"]!.map((x) => x)),
      precipitationSum: json["precipitation_sum"] == null ? [] : List<int>.from(json["precipitation_sum"]!.map((x) => x)),
      snowfallSum: json["snowfall_sum"] == null ? [] : List<int>.from(json["snowfall_sum"]!.map((x) => x)),
    );
  }

  @override
  List<Object?> get props => [
    time, weatherCode, sunrise, sunset, uvIndexMax, precipitationSum, snowfallSum, ];
}

class DailyUnits extends Equatable {
  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
    required this.precipitationSum,
    required this.snowfallSum,
  });

  final String? time;
  final String? weatherCode;
  final String? sunrise;
  final String? sunset;
  final String? uvIndexMax;
  final String? precipitationSum;
  final String? snowfallSum;

  factory DailyUnits.fromJson(Map<String, dynamic> json){
    return DailyUnits(
      time: json["time"],
      weatherCode: json["weather_code"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      uvIndexMax: json["uv_index_max"],
      precipitationSum: json["precipitation_sum"],
      snowfallSum: json["snowfall_sum"],
    );
  }

  @override
  List<Object?> get props => [
    time, weatherCode, sunrise, sunset, uvIndexMax, precipitationSum, snowfallSum, ];
}

class Hourly extends Equatable {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitationProbability,
    required this.rain,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
    required this.windSpeed10M,
    required this.temperature80M,
    required this.uvIndex,
    required this.uvIndexClearSky,
  });

  final List<String> time;
  final List<double> temperature2M;
  final List<int> relativeHumidity2M;
  final List<int> precipitationProbability;
  final List<int> rain;
  final List<int> snowfall;
  final List<int> weatherCode;
  final List<int> visibility;
  final List<double> windSpeed10M;
  final List<double> temperature80M;
  final List<double> uvIndex;
  final List<double> uvIndexClearSky;

  factory Hourly.fromJson(Map<String, dynamic> json){
    return Hourly(
      time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M: json["temperature_2m"] == null ? [] : List<double>.from(json["temperature_2m"]!.map((x) => x)),
      relativeHumidity2M: json["relative_humidity_2m"] == null ? [] : List<int>.from(json["relative_humidity_2m"]!.map((x) => x)),
      precipitationProbability: json["precipitation_probability"] == null ? [] : List<int>.from(json["precipitation_probability"]!.map((x) => x)),
      rain: json["rain"] == null ? [] : List<int>.from(json["rain"]!.map((x) => x)),
      snowfall: json["snowfall"] == null ? [] : List<int>.from(json["snowfall"]!.map((x) => x)),
      weatherCode: json["weather_code"] == null ? [] : List<int>.from(json["weather_code"]!.map((x) => x)),
      visibility: json["visibility"] == null ? [] : List<int>.from(json["visibility"]!.map((x) => x)),
      windSpeed10M: json["wind_speed_10m"] == null ? [] : List<double>.from(json["wind_speed_10m"]!.map((x) => x)),
      temperature80M: json["temperature_80m"] == null ? [] : List<double>.from(json["temperature_80m"]!.map((x) => x)),
      uvIndex: json["uv_index"] == null ? [] : List<double>.from(json["uv_index"]!.map((x) => x)),
      uvIndexClearSky: json["uv_index_clear_sky"] == null ? [] : List<double>.from(json["uv_index_clear_sky"]!.map((x) => x)),
    );
  }

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, precipitationProbability, rain, snowfall, weatherCode, visibility, windSpeed10M, temperature80M, uvIndex, uvIndexClearSky, ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitationProbability,
    required this.rain,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
    required this.windSpeed10M,
    required this.temperature80M,
    required this.uvIndex,
    required this.uvIndexClearSky,
  });

  final String? time;
  final String? temperature2M;
  final String? relativeHumidity2M;
  final String? precipitationProbability;
  final String? rain;
  final String? snowfall;
  final String? weatherCode;
  final String? visibility;
  final String? windSpeed10M;
  final String? temperature80M;
  final String? uvIndex;
  final String? uvIndexClearSky;

  factory HourlyUnits.fromJson(Map<String, dynamic> json){
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitationProbability: json["precipitation_probability"],
      rain: json["rain"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
      visibility: json["visibility"],
      windSpeed10M: json["wind_speed_10m"],
      temperature80M: json["temperature_80m"],
      uvIndex: json["uv_index"],
      uvIndexClearSky: json["uv_index_clear_sky"],
    );
  }

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, precipitationProbability, rain, snowfall, weatherCode, visibility, windSpeed10M, temperature80M, uvIndex, uvIndexClearSky, ];
}
