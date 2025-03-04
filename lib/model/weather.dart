// import 'package:equatable/equatable.dart';
//
// class Weather extends Equatable {
//   Weather({
//     required this.latitude,
//     required this.longitude,
//     required this.generationtimeMs,
//     required this.utcOffsetSeconds,
//     required this.timezone,
//     required this.timezoneAbbreviation,
//     required this.elevation,
//     required this.currentUnits,
//     required this.current,
//     required this.hourlyUnits,
//     required this.hourly,
//     required this.dailyUnits,
//     required this.daily,
//   });
//
//   final double? latitude;
//   final double? longitude;
//   final double? generationtimeMs;
//   final int? utcOffsetSeconds;
//   final String? timezone;
//   final String? timezoneAbbreviation;
//   final int? elevation;
//   final CurrentUnits? currentUnits;
//   final Current? current;
//   final HourlyUnits? hourlyUnits;
//   final Hourly? hourly;
//   final DailyUnits? dailyUnits;
//   final Daily? daily;
//
//   factory Weather.fromJson(Map<String, dynamic> json){
//     return Weather(
//       latitude: json["latitude"],
//       longitude: json["longitude"],
//       generationtimeMs: json["generationtime_ms"],
//       utcOffsetSeconds: json["utc_offset_seconds"],
//       timezone: json["timezone"],
//       timezoneAbbreviation: json["timezone_abbreviation"],
//       elevation: json["elevation"],
//       currentUnits: json["current_units"] == null ? null : CurrentUnits.fromJson(json["current_units"]),
//       current: json["current"] == null ? null : Current.fromJson(json["current"]),
//       hourlyUnits: json["hourly_units"] == null ? null : HourlyUnits.fromJson(json["hourly_units"]),
//       hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
//       dailyUnits: json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]),
//       daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "latitude": latitude,
//     "longitude": longitude,
//     "generationtime_ms": generationtimeMs,
//     "utc_offset_seconds": utcOffsetSeconds,
//     "timezone": timezone,
//     "timezone_abbreviation": timezoneAbbreviation,
//     "elevation": elevation,
//     "current_units": currentUnits?.toJson(),
//     "current": current?.toJson(),
//     "hourly_units": hourlyUnits?.toJson(),
//     "hourly": hourly?.toJson(),
//     "daily_units": dailyUnits?.toJson(),
//     "daily": daily?.toJson(),
//   };
//
//   @override
//   List<Object?> get props => [
//     latitude, longitude, generationtimeMs, utcOffsetSeconds, timezone, timezoneAbbreviation, elevation, currentUnits, current, hourlyUnits, hourly, dailyUnits, daily, ];
// }
//
// class Current extends Equatable {
//   Current({
//     required this.time,
//     required this.interval,
//     required this.temperature2M,
//     required this.relativeHumidity2M,
//     required this.precipitation,
//     required this.snowfall,
//     required this.weatherCode,
//   });
//
//   final String? time;
//   final int? interval;
//   final double? temperature2M;
//   final double? relativeHumidity2M;
//   final double? precipitation;
//   final double? snowfall;
//   final int? weatherCode;
//
//   factory Current.fromJson(Map<String, dynamic> json){
//     return Current(
//       time: json["time"],
//       interval: json["interval"],
//       temperature2M: json["temperature_2m"],
//       relativeHumidity2M: json["relative_humidity_2m"],
//       precipitation: json["precipitation"],
//       snowfall: json["snowfall"],
//       weatherCode: json["weather_code"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time,
//     "interval": interval,
//     "temperature_2m": temperature2M,
//     "relative_humidity_2m": relativeHumidity2M,
//     "precipitation": precipitation,
//     "snowfall": snowfall,
//     "weather_code": weatherCode,
//   };
//
//   @override
//   List<Object?> get props => [
//     time, interval, temperature2M, relativeHumidity2M, precipitation, snowfall, weatherCode, ];
// }
//
// class CurrentUnits extends Equatable {
//   CurrentUnits({
//     required this.time,
//     required this.interval,
//     required this.temperature2M,
//     required this.relativeHumidity2M,
//     required this.precipitation,
//     required this.snowfall,
//     required this.weatherCode,
//   });
//
//   final String? time;
//   final String? interval;
//   final String? temperature2M;
//   final String? relativeHumidity2M;
//   final String? precipitation;
//   final String? snowfall;
//   final String? weatherCode;
//
//   factory CurrentUnits.fromJson(Map<String, dynamic> json){
//     return CurrentUnits(
//       time: json["time"],
//       interval: json["interval"],
//       temperature2M: json["temperature_2m"],
//       relativeHumidity2M: json["relative_humidity_2m"],
//       precipitation: json["precipitation"],
//       snowfall: json["snowfall"],
//       weatherCode: json["weather_code"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time,
//     "interval": interval,
//     "temperature_2m": temperature2M,
//     "relative_humidity_2m": relativeHumidity2M,
//     "precipitation": precipitation,
//     "snowfall": snowfall,
//     "weather_code": weatherCode,
//   };
//
//   @override
//   List<Object?> get props => [
//     time, interval, temperature2M, relativeHumidity2M, precipitation, snowfall, weatherCode, ];
// }
//
// class Daily extends Equatable {
//   Daily({
//     required this.time,
//     required this.weatherCode,
//     required this.sunrise,
//     required this.sunset,
//     required this.uvIndexMax,
//     required this.precipitationSum,
//     required this.snowfallSum,
//   });
//
//   final List<DateTime> time;
//   final List<int> weatherCode;
//   final List<String> sunrise;
//   final List<String> sunset;
//   final List<double> uvIndexMax;
//   final List<double> precipitationSum;
//   final List<int> snowfallSum;
//
//   factory Daily.fromJson(Map<String, dynamic> json){
//     return Daily(
//       time: json["time"] == null ? [] : List<DateTime>.from(json["time"]!.map((x) => DateTime.tryParse(x ?? ""))),
//       weatherCode: json["weather_code"] == null ? [] : List<int>.from(json["weather_code"]!.map((x) => x)),
//       sunrise: json["sunrise"] == null ? [] : List<String>.from(json["sunrise"]!.map((x) => x)),
//       sunset: json["sunset"] == null ? [] : List<String>.from(json["sunset"]!.map((x) => x)),
//       uvIndexMax: json["uv_index_max"] == null ? [] : List<double>.from(json["uv_index_max"]!.map((x) => x)),
//       precipitationSum: json["precipitation_sum"] == null ? [] : List<double>.from(json["precipitation_sum"]!.map((x) => x)),
//       snowfallSum: json["snowfall_sum"] == null ? [] : List<int>.from(json["snowfall_sum"]!.map((x) => x)),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time.map((x) => "${x.year.toString().padLeft(4,'0')}-${x.month.toString().padLeft(2,'0')}-${x.day.toString().padLeft(2,'0')}").toList(),
//     "weather_code": weatherCode.map((x) => x).toList(),
//     "sunrise": sunrise.map((x) => x).toList(),
//     "sunset": sunset.map((x) => x).toList(),
//     "uv_index_max": uvIndexMax.map((x) => x).toList(),
//     "precipitation_sum": precipitationSum.map((x) => x).toList(),
//     "snowfall_sum": snowfallSum.map((x) => x).toList(),
//   };
//
//   @override
//   List<Object?> get props => [
//     time, weatherCode, sunrise, sunset, uvIndexMax, precipitationSum, snowfallSum, ];
// }
//
// class DailyUnits extends Equatable {
//   DailyUnits({
//     required this.time,
//     required this.weatherCode,
//     required this.sunrise,
//     required this.sunset,
//     required this.uvIndexMax,
//     required this.precipitationSum,
//     required this.snowfallSum,
//   });
//
//   final String? time;
//   final String? weatherCode;
//   final String? sunrise;
//   final String? sunset;
//   final String? uvIndexMax;
//   final String? precipitationSum;
//   final String? snowfallSum;
//
//   factory DailyUnits.fromJson(Map<String, dynamic> json){
//     return DailyUnits(
//       time: json["time"],
//       weatherCode: json["weather_code"],
//       sunrise: json["sunrise"],
//       sunset: json["sunset"],
//       uvIndexMax: json["uv_index_max"],
//       precipitationSum: json["precipitation_sum"],
//       snowfallSum: json["snowfall_sum"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time,
//     "weather_code": weatherCode,
//     "sunrise": sunrise,
//     "sunset": sunset,
//     "uv_index_max": uvIndexMax,
//     "precipitation_sum": precipitationSum,
//     "snowfall_sum": snowfallSum,
//   };
//
//   @override
//   List<Object?> get props => [
//     time, weatherCode, sunrise, sunset, uvIndexMax, precipitationSum, snowfallSum, ];
// }
//
// class Hourly extends Equatable {
//   Hourly({
//     required this.time,
//     required this.temperature2M,
//     required this.relativeHumidity2M,
//     required this.precipitationProbability,
//     required this.snowfall,
//     required this.weatherCode,
//     required this.windSpeed10M,
//     required this.temperature1000HPa,
//     required this.relativeHumidity1000HPa,
//     required this.windSpeed1000HPa,
//   });
//
//   final List<String> time;
//   final List<double> temperature2M;
//   final List<double> relativeHumidity2M;
//   final List<double> precipitationProbability;
//   final List<int> snowfall;
//   final List<int> weatherCode;
//   final List<double> windSpeed10M;
//   final List<double> temperature1000HPa;
//   final List<double> relativeHumidity1000HPa;
//   final List<double> windSpeed1000HPa;
//
//   factory Hourly.fromJson(Map<String, dynamic> json){
//     return Hourly(
//       time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
//       temperature2M: json["temperature_2m"] == null ? [] : List<double>.from(json["temperature_2m"]!.map((x) => x)),
//       relativeHumidity2M: json["relative_humidity_2m"] == null ? [] : List<double>.from(json["relative_humidity_2m"]!.map((x) => x)),
//       precipitationProbability: json["precipitation_probability"] == null ? [] : List<double>.from(json["precipitation_probability"]!.map((x) => x)),
//       snowfall: json["snowfall"] == null ? [] : List<int>.from(json["snowfall"]!.map((x) => x)),
//       weatherCode: json["weather_code"] == null ? [] : List<int>.from(json["weather_code"]!.map((x) => x)),
//       windSpeed10M: json["wind_speed_10m"] == null ? [] : List<double>.from(json["wind_speed_10m"]!.map((x) => x)),
//       temperature1000HPa: json["temperature_1000hPa"] == null ? [] : List<double>.from(json["temperature_1000hPa"]!.map((x) => x)),
//       relativeHumidity1000HPa: json["relative_humidity_1000hPa"] == null ? [] : List<double>.from(json["relative_humidity_1000hPa"]!.map((x) => x)),
//       windSpeed1000HPa: json["wind_speed_1000hPa"] == null ? [] : List<double>.from(json["wind_speed_1000hPa"]!.map((x) => x)),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time.map((x) => x).toList(),
//     "temperature_2m": temperature2M.map((x) => x).toList(),
//     "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
//     "precipitation_probability": precipitationProbability.map((x) => x).toList(),
//     "snowfall": snowfall.map((x) => x).toList(),
//     "weather_code": weatherCode.map((x) => x).toList(),
//     "wind_speed_10m": windSpeed10M.map((x) => x).toList(),
//     "temperature_1000hPa": temperature1000HPa.map((x) => x).toList(),
//     "relative_humidity_1000hPa": relativeHumidity1000HPa.map((x) => x).toList(),
//     "wind_speed_1000hPa": windSpeed1000HPa.map((x) => x).toList(),
//   };
//
//   @override
//   List<Object?> get props => [
//     time, temperature2M, relativeHumidity2M, precipitationProbability, snowfall, weatherCode, windSpeed10M, temperature1000HPa, relativeHumidity1000HPa, windSpeed1000HPa, ];
// }
//
// class HourlyUnits extends Equatable {
//   HourlyUnits({
//     required this.time,
//     required this.temperature2M,
//     required this.relativeHumidity2M,
//     required this.precipitationProbability,
//     required this.snowfall,
//     required this.weatherCode,
//     required this.windSpeed10M,
//     required this.temperature1000HPa,
//     required this.relativeHumidity1000HPa,
//     required this.windSpeed1000HPa,
//   });
//
//   final String? time;
//   final String? temperature2M;
//   final String? relativeHumidity2M;
//   final String? precipitationProbability;
//   final String? snowfall;
//   final String? weatherCode;
//   final String? windSpeed10M;
//   final String? temperature1000HPa;
//   final String? relativeHumidity1000HPa;
//   final String? windSpeed1000HPa;
//
//   factory HourlyUnits.fromJson(Map<String, dynamic> json){
//     return HourlyUnits(
//       time: json["time"],
//       temperature2M: json["temperature_2m"],
//       relativeHumidity2M: json["relative_humidity_2m"],
//       precipitationProbability: json["precipitation_probability"],
//       snowfall: json["snowfall"],
//       weatherCode: json["weather_code"],
//       windSpeed10M: json["wind_speed_10m"],
//       temperature1000HPa: json["temperature_1000hPa"],
//       relativeHumidity1000HPa: json["relative_humidity_1000hPa"],
//       windSpeed1000HPa: json["wind_speed_1000hPa"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "time": time,
//     "temperature_2m": temperature2M,
//     "relative_humidity_2m": relativeHumidity2M,
//     "precipitation_probability": precipitationProbability,
//     "snowfall": snowfall,
//     "weather_code": weatherCode,
//     "wind_speed_10m": windSpeed10M,
//     "temperature_1000hPa": temperature1000HPa,
//     "relative_humidity_1000hPa": relativeHumidity1000HPa,
//     "wind_speed_1000hPa": windSpeed1000HPa,
//   };
//
//   @override
//   List<Object?> get props => [
//     time, temperature2M, relativeHumidity2M, precipitationProbability, snowfall, weatherCode, windSpeed10M, temperature1000HPa, relativeHumidity1000HPa, windSpeed1000HPa, ];
// }


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

  final num? latitude;
  final num? longitude;
  final num? generationtimeMs;
  final num? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final num? elevation;
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

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits?.toJson(),
    "current": current?.toJson(),
    "hourly_units": hourlyUnits?.toJson(),
    "hourly": hourly?.toJson(),
    "daily_units": dailyUnits?.toJson(),
    "daily": daily?.toJson(),
  };

  @override
  List<Object?> get props => [
    latitude, longitude, generationtimeMs, utcOffsetSeconds, timezone, timezoneAbbreviation, elevation, currentUnits, current, hourlyUnits, hourly, dailyUnits, daily, ];
}

class Current extends Equatable {
  Current({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitation,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final int? interval;
  final double? temperature2M;
  final int? relativeHumidity2M;
  final num? precipitation;
  final num? snowfall;
  final num? weatherCode;

  factory Current.fromJson(Map<String, dynamic> json){
    return Current(
      time: json["time"],
      interval: json["interval"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitation: json["precipitation"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "precipitation": precipitation,
    "snowfall": snowfall,
    "weather_code": weatherCode,
  };

  @override
  List<Object?> get props => [
    time, interval, temperature2M, relativeHumidity2M, precipitation, snowfall, weatherCode, ];
}

class CurrentUnits extends Equatable {
  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitation,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final String? interval;
  final String? temperature2M;
  final String? relativeHumidity2M;
  final String? precipitation;
  final String? snowfall;
  final String? weatherCode;

  factory CurrentUnits.fromJson(Map<String, dynamic> json){
    return CurrentUnits(
      time: json["time"],
      interval: json["interval"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitation: json["precipitation"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "precipitation": precipitation,
    "snowfall": snowfall,
    "weather_code": weatherCode,
  };

  @override
  List<Object?> get props => [
    time, interval, temperature2M, relativeHumidity2M, precipitation, snowfall, weatherCode, ];
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
  final List<num> weatherCode;
  final List<String> sunrise;
  final List<String> sunset;
  final List<num> uvIndexMax;
  final List<num> precipitationSum;
  final List<num> snowfallSum;

  factory Daily.fromJson(Map<String, dynamic> json){
    return Daily(
      time: json["time"] == null ? [] : List<DateTime>.from(json["time"]!.map((x) => DateTime.tryParse(x ?? ""))),
      weatherCode: json["weather_code"] == null ? [] : List<num>.from(json["weather_code"]!.map((x) => x)),
      sunrise: json["sunrise"] == null ? [] : List<String>.from(json["sunrise"]!.map((x) => x)),
      sunset: json["sunset"] == null ? [] : List<String>.from(json["sunset"]!.map((x) => x)),
      uvIndexMax: json["uv_index_max"] == null ? [] : List<num>.from(json["uv_index_max"]!.map((x) => x)),
      precipitationSum: json["precipitation_sum"] == null ? [] : List<num>.from(json["precipitation_sum"]!.map((x) => x)),
      snowfallSum: json["snowfall_sum"] == null ? [] : List<num>.from(json["snowfall_sum"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => "${x.year.toString().padLeft(4,'0')}-${x.month.toString().padLeft(2,'0')}-${x.day.toString().padLeft(2,'0')}").toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "sunrise": sunrise.map((x) => x).toList(),
    "sunset": sunset.map((x) => x).toList(),
    "uv_index_max": uvIndexMax.map((x) => x).toList(),
    "precipitation_sum": precipitationSum.map((x) => x).toList(),
    "snowfall_sum": snowfallSum.map((x) => x).toList(),
  };

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

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "sunrise": sunrise,
    "sunset": sunset,
    "uv_index_max": uvIndexMax,
    "precipitation_sum": precipitationSum,
    "snowfall_sum": snowfallSum,
  };

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
    required this.snowfall,
    required this.weatherCode,
    required this.windSpeed10M,
    required this.temperature1000HPa,
    required this.relativeHumidity1000HPa,
    required this.windSpeed1000HPa,
  });

  final List<String> time;
  final List<num> temperature2M;
  final List<num> relativeHumidity2M;
  final List<num> precipitationProbability;
  final List<num> snowfall;
  final List<num> weatherCode;
  final List<num> windSpeed10M;
  final List<num> temperature1000HPa;
  final List<num> relativeHumidity1000HPa;
  final List<num> windSpeed1000HPa;

  factory Hourly.fromJson(Map<String, dynamic> json){
    return Hourly(
      time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M: json["temperature_2m"] == null ? [] : List<num>.from(json["temperature_2m"]!.map((x) => x)),
      relativeHumidity2M: json["relative_humidity_2m"] == null ? [] : List<num>.from(json["relative_humidity_2m"]!.map((x) => x)),
      precipitationProbability: json["precipitation_probability"] == null ? [] : List<num>.from(json["precipitation_probability"]!.map((x) => x)),
      snowfall: json["snowfall"] == null ? [] : List<num>.from(json["snowfall"]!.map((x) => x)),
      weatherCode: json["weather_code"] == null ? [] : List<num>.from(json["weather_code"]!.map((x) => x)),
      windSpeed10M: json["wind_speed_10m"] == null ? [] : List<num>.from(json["wind_speed_10m"]!.map((x) => x)),
      temperature1000HPa: json["temperature_1000hPa"] == null ? [] : List<num>.from(json["temperature_1000hPa"]!.map((x) => x)),
      relativeHumidity1000HPa: json["relative_humidity_1000hPa"] == null ? [] : List<num>.from(json["relative_humidity_1000hPa"]!.map((x) => x)),
      windSpeed1000HPa: json["wind_speed_1000hPa"] == null ? [] : List<num>.from(json["wind_speed_1000hPa"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => x).toList(),
    "temperature_2m": temperature2M.map((x) => x).toList(),
    "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
    "precipitation_probability": precipitationProbability.map((x) => x).toList(),
    "snowfall": snowfall.map((x) => x).toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "wind_speed_10m": windSpeed10M.map((x) => x).toList(),
    "temperature_1000hPa": temperature1000HPa.map((x) => x).toList(),
    "relative_humidity_1000hPa": relativeHumidity1000HPa.map((x) => x).toList(),
    "wind_speed_1000hPa": windSpeed1000HPa.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, precipitationProbability, snowfall, weatherCode, windSpeed10M, temperature1000HPa, relativeHumidity1000HPa, windSpeed1000HPa, ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitationProbability,
    required this.snowfall,
    required this.weatherCode,
    required this.windSpeed10M,
    required this.temperature1000HPa,
    required this.relativeHumidity1000HPa,
    required this.windSpeed1000HPa,
  });

  final String? time;
  final String? temperature2M;
  final String? relativeHumidity2M;
  final String? precipitationProbability;
  final String? snowfall;
  final String? weatherCode;
  final String? windSpeed10M;
  final String? temperature1000HPa;
  final String? relativeHumidity1000HPa;
  final String? windSpeed1000HPa;

  factory HourlyUnits.fromJson(Map<String, dynamic> json){
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitationProbability: json["precipitation_probability"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
      windSpeed10M: json["wind_speed_10m"],
      temperature1000HPa: json["temperature_1000hPa"],
      relativeHumidity1000HPa: json["relative_humidity_1000hPa"],
      windSpeed1000HPa: json["wind_speed_1000hPa"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "precipitation_probability": precipitationProbability,
    "snowfall": snowfall,
    "weather_code": weatherCode,
    "wind_speed_10m": windSpeed10M,
    "temperature_1000hPa": temperature1000HPa,
    "relative_humidity_1000hPa": relativeHumidity1000HPa,
    "wind_speed_1000hPa": windSpeed1000HPa,
  };

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, precipitationProbability, snowfall, weatherCode, windSpeed10M, temperature1000HPa, relativeHumidity1000HPa, windSpeed1000HPa, ];
}

