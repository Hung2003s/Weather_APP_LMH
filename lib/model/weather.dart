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

  final num latitude;
  final num longitude;
  final num generationtimeMs;
  final num utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final num elevation;
  final CurrentUnits? currentUnits;
  final Current? current;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      latitude: json["latitude"] ?? 0,
      longitude: json["longitude"] ?? 0,
      generationtimeMs: json["generationtime_ms"] ?? 0,
      utcOffsetSeconds: json["utc_offset_seconds"] ?? 0,
      timezone: json["timezone"] ?? "",
      timezoneAbbreviation: json["timezone_abbreviation"] ?? "",
      elevation: json["elevation"] ?? 0,
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
    required this.windSpeed10M,
    required this.relativeHumidity2M,
    required this.snowfall,
    required this.precipitation,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.windDirection10M,
    required this.rain,
  });

  final String time;
  final num interval;
  final num temperature2M;
  final num windSpeed10M;
  final int relativeHumidity2M;
  final num snowfall;
  final num precipitation;
  final num apparentTemperature;
  final num weatherCode;
  final num windDirection10M;
  final num rain;

  factory Current.fromJson(Map<String, dynamic> json){
    return Current(
      time: json["time"] ?? "",
      interval: json["interval"] ?? 0,
      temperature2M: json["temperature_2m"] ?? 0,
      windSpeed10M: json["wind_speed_10m"] ?? 0,
      relativeHumidity2M: json["relative_humidity_2m"] ?? 0,
      snowfall: json["snowfall"] ?? 0,
      precipitation: json["precipitation"] ?? 0,
      apparentTemperature: json["apparent_temperature"] ?? 0,
      weatherCode: json["weather_code"] ?? 0,
      windDirection10M: json["wind_direction_10m"] ?? 0,
      rain: json["rain"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
    "relative_humidity_2m": relativeHumidity2M,
    "snowfall": snowfall,
    "precipitation": precipitation,
    "apparent_temperature": apparentTemperature,
    "weather_code": weatherCode,
    "wind_direction_10m": windDirection10M,
    "rain": rain,
  };

  @override
  List<Object?> get props => [
    time, interval, temperature2M, windSpeed10M, relativeHumidity2M, snowfall, precipitation, apparentTemperature, weatherCode, windDirection10M, rain, ];
}

class CurrentUnits extends Equatable {
  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.windSpeed10M,
    required this.relativeHumidity2M,
    required this.snowfall,
    required this.precipitation,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.windDirection10M,
    required this.rain,
  });

  final String time;
  final String interval;
  final String temperature2M;
  final String windSpeed10M;
  final String relativeHumidity2M;
  final String snowfall;
  final String precipitation;
  final String apparentTemperature;
  final String weatherCode;
  final String windDirection10M;
  final String rain;

  factory CurrentUnits.fromJson(Map<String, dynamic> json){
    return CurrentUnits(
      time: json["time"] ?? "",
      interval: json["interval"] ?? "",
      temperature2M: json["temperature_2m"] ?? "",
      windSpeed10M: json["wind_speed_10m"] ?? "",
      relativeHumidity2M: json["relative_humidity_2m"] ?? "",
      snowfall: json["snowfall"] ?? "",
      precipitation: json["precipitation"] ?? "",
      apparentTemperature: json["apparent_temperature"] ?? "",
      weatherCode: json["weather_code"] ?? "",
      windDirection10M: json["wind_direction_10m"] ?? "",
      rain: json["rain"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
    "relative_humidity_2m": relativeHumidity2M,
    "snowfall": snowfall,
    "precipitation": precipitation,
    "apparent_temperature": apparentTemperature,
    "weather_code": weatherCode,
    "wind_direction_10m": windDirection10M,
    "rain": rain,
  };

  @override
  List<Object?> get props => [
    time, interval, temperature2M, windSpeed10M, relativeHumidity2M, snowfall, precipitation, apparentTemperature, weatherCode, windDirection10M, rain, ];
}

class Daily extends Equatable {
  Daily({
    required this.time,
    required this.weatherCode,
    required this.sunset,
    required this.uvIndexMax,
    required this.rainSum,
    required this.precipitationHours,
    required this.sunrise,
    required this.snowfallSum,
    required this.precipitationSum,
    required this.temperature2MMax,
    required this.precipitationProbabilityMax,
  });

  final List<DateTime> time;
  final List<num> weatherCode;
  final List<String> sunset;
  final List<num> uvIndexMax;
  final List<num> rainSum;
  final List<num> precipitationHours;
  final List<String> sunrise;
  final List<num> snowfallSum;
  final List<num> precipitationSum;
  final List<num> temperature2MMax;
  final List<num> precipitationProbabilityMax;

  factory Daily.fromJson(Map<String, dynamic> json){
    return Daily(
      time: json["time"] == null ? [] : List<DateTime>.from(json["time"]!.map((x) => DateTime.tryParse(x ?? ""))),
      weatherCode: json["weather_code"] == null ? [] : List<num>.from(json["weather_code"]!.map((x) => x)),
      sunset: json["sunset"] == null ? [] : List<String>.from(json["sunset"]!.map((x) => x)),
      uvIndexMax: json["uv_index_max"] == null ? [] : List<num>.from(json["uv_index_max"]!.map((x) => x)),
      rainSum: json["rain_sum"] == null ? [] : List<num>.from(json["rain_sum"]!.map((x) => x)),
      precipitationHours: json["precipitation_hours"] == null ? [] : List<num>.from(json["precipitation_hours"]!.map((x) => x)),
      sunrise: json["sunrise"] == null ? [] : List<String>.from(json["sunrise"]!.map((x) => x)),
      snowfallSum: json["snowfall_sum"] == null ? [] : List<num>.from(json["snowfall_sum"]!.map((x) => x)),
      precipitationSum: json["precipitation_sum"] == null ? [] : List<num>.from(json["precipitation_sum"]!.map((x) => x)),
      temperature2MMax: json["temperature_2m_max"] == null ? [] : List<num>.from(json["temperature_2m_max"]!.map((x) => x)),
      precipitationProbabilityMax: json["precipitation_probability_max"] == null ? [] : List<num>.from(json["precipitation_probability_max"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => "${x.year.toString().padLeft(4,'0')}-${x.month.toString().padLeft(2,'0')}-${x.day.toString().padLeft(2,'0')}").toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "sunset": sunset.map((x) => x).toList(),
    "uv_index_max": uvIndexMax.map((x) => x).toList(),
    "rain_sum": rainSum.map((x) => x).toList(),
    "precipitation_hours": precipitationHours.map((x) => x).toList(),
    "sunrise": sunrise.map((x) => x).toList(),
    "snowfall_sum": snowfallSum.map((x) => x).toList(),
    "precipitation_sum": precipitationSum.map((x) => x).toList(),
    "temperature_2m_max": temperature2MMax.map((x) => x).toList(),
    "precipitation_probability_max": precipitationProbabilityMax.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time, weatherCode, sunset, uvIndexMax, rainSum, precipitationHours, sunrise, snowfallSum, precipitationSum, temperature2MMax, precipitationProbabilityMax, ];
}

class DailyUnits extends Equatable {
  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.sunset,
    required this.uvIndexMax,
    required this.rainSum,
    required this.precipitationHours,
    required this.sunrise,
    required this.snowfallSum,
    required this.precipitationSum,
    required this.temperature2MMax,
    required this.precipitationProbabilityMax,
  });

  final String time;
  final String weatherCode;
  final String sunset;
  final String uvIndexMax;
  final String rainSum;
  final String precipitationHours;
  final String sunrise;
  final String snowfallSum;
  final String precipitationSum;
  final String temperature2MMax;
  final String precipitationProbabilityMax;

  factory DailyUnits.fromJson(Map<String, dynamic> json){
    return DailyUnits(
      time: json["time"] ?? "",
      weatherCode: json["weather_code"] ?? "",
      sunset: json["sunset"] ?? "",
      uvIndexMax: json["uv_index_max"] ?? "",
      rainSum: json["rain_sum"] ?? "",
      precipitationHours: json["precipitation_hours"] ?? "",
      sunrise: json["sunrise"] ?? "",
      snowfallSum: json["snowfall_sum"] ?? "",
      precipitationSum: json["precipitation_sum"] ?? "",
      temperature2MMax: json["temperature_2m_max"] ?? "",
      precipitationProbabilityMax: json["precipitation_probability_max"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "sunset": sunset,
    "uv_index_max": uvIndexMax,
    "rain_sum": rainSum,
    "precipitation_hours": precipitationHours,
    "sunrise": sunrise,
    "snowfall_sum": snowfallSum,
    "precipitation_sum": precipitationSum,
    "temperature_2m_max": temperature2MMax,
    "precipitation_probability_max": precipitationProbabilityMax,
  };

  @override
  List<Object?> get props => [
    time, weatherCode, sunset, uvIndexMax, rainSum, precipitationHours, sunrise, snowfallSum, precipitationSum, temperature2MMax, precipitationProbabilityMax, ];
}

class Hourly extends Equatable {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.rain,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
    required this.windSpeed10M,
    required this.temperature80M,
    required this.uvIndex,
    required this.temperature1000HPa,
    required this.relativeHumidity1000HPa,
  });

  final List<String> time;
  final List<num> temperature2M;
  final List<num> relativeHumidity2M;
  final List<num> apparentTemperature;
  final List<num> precipitationProbability;
  final List<num> rain;
  final List<num> snowfall;
  final List<num> weatherCode;
  final List<num> visibility;
  final List<num> windSpeed10M;
  final List<num> temperature80M;
  final List<num> uvIndex;
  final List<num> temperature1000HPa;
  final List<num> relativeHumidity1000HPa;

  factory Hourly.fromJson(Map<String, dynamic> json){
    return Hourly(
      time: json["time"] == null ? [] : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M: json["temperature_2m"] == null ? [] : List<num>.from(json["temperature_2m"]!.map((x) => x)),
      relativeHumidity2M: json["relative_humidity_2m"] == null ? [] : List<num>.from(json["relative_humidity_2m"]!.map((x) => x)),
      apparentTemperature: json["apparent_temperature"] == null ? [] : List<num>.from(json["apparent_temperature"]!.map((x) => x)),
      precipitationProbability: json["precipitation_probability"] == null ? [] : List<num>.from(json["precipitation_probability"]!.map((x) => x)),
      rain: json["rain"] == null ? [] : List<num>.from(json["rain"]!.map((x) => x)),
      snowfall: json["snowfall"] == null ? [] : List<num>.from(json["snowfall"]!.map((x) => x)),
      weatherCode: json["weather_code"] == null ? [] : List<num>.from(json["weather_code"]!.map((x) => x)),
      visibility: json["visibility"] == null ? [] : List<num>.from(json["visibility"]!.map((x) => x)),
      windSpeed10M: json["wind_speed_10m"] == null ? [] : List<num>.from(json["wind_speed_10m"]!.map((x) => x)),
      temperature80M: json["temperature_80m"] == null ? [] : List<num>.from(json["temperature_80m"]!.map((x) => x)),
      uvIndex: json["uv_index"] == null ? [] : List<num>.from(json["uv_index"]!.map((x) => x)),
      temperature1000HPa: json["temperature_1000hPa"] == null ? [] : List<num>.from(json["temperature_1000hPa"]!.map((x) => x)),
      relativeHumidity1000HPa: json["relative_humidity_1000hPa"] == null ? [] : List<num>.from(json["relative_humidity_1000hPa"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => x).toList(),
    "temperature_2m": temperature2M.map((x) => x).toList(),
    "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
    "apparent_temperature": apparentTemperature.map((x) => x).toList(),
    "precipitation_probability": precipitationProbability.map((x) => x).toList(),
    "rain": rain.map((x) => x).toList(),
    "snowfall": snowfall.map((x) => x).toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "visibility": visibility.map((x) => x).toList(),
    "wind_speed_10m": windSpeed10M.map((x) => x).toList(),
    "temperature_80m": temperature80M.map((x) => x).toList(),
    "uv_index": uvIndex.map((x) => x).toList(),
    "temperature_1000hPa": temperature1000HPa.map((x) => x).toList(),
    "relative_humidity_1000hPa": relativeHumidity1000HPa.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, apparentTemperature, precipitationProbability, rain, snowfall, weatherCode, visibility, windSpeed10M, temperature80M, uvIndex, temperature1000HPa, relativeHumidity1000HPa, ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.rain,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
    required this.windSpeed10M,
    required this.temperature80M,
    required this.uvIndex,
    required this.temperature1000HPa,
    required this.relativeHumidity1000HPa,
  });

  final String time;
  final String temperature2M;
  final String relativeHumidity2M;
  final String apparentTemperature;
  final String precipitationProbability;
  final String rain;
  final String snowfall;
  final String weatherCode;
  final String visibility;
  final String windSpeed10M;
  final String temperature80M;
  final String uvIndex;
  final String temperature1000HPa;
  final String relativeHumidity1000HPa;

  factory HourlyUnits.fromJson(Map<String, dynamic> json){
    return HourlyUnits(
      time: json["time"] ?? "",
      temperature2M: json["temperature_2m"] ?? "",
      relativeHumidity2M: json["relative_humidity_2m"] ?? "",
      apparentTemperature: json["apparent_temperature"] ?? "",
      precipitationProbability: json["precipitation_probability"] ?? "",
      rain: json["rain"] ?? "",
      snowfall: json["snowfall"] ?? "",
      weatherCode: json["weather_code"] ?? "",
      visibility: json["visibility"] ?? "",
      windSpeed10M: json["wind_speed_10m"] ?? "",
      temperature80M: json["temperature_80m"] ?? "",
      uvIndex: json["uv_index"] ?? "",
      temperature1000HPa: json["temperature_1000hPa"] ?? "",
      relativeHumidity1000HPa: json["relative_humidity_1000hPa"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "apparent_temperature": apparentTemperature,
    "precipitation_probability": precipitationProbability,
    "rain": rain,
    "snowfall": snowfall,
    "weather_code": weatherCode,
    "visibility": visibility,
    "wind_speed_10m": windSpeed10M,
    "temperature_80m": temperature80M,
    "uv_index": uvIndex,
    "temperature_1000hPa": temperature1000HPa,
    "relative_humidity_1000hPa": relativeHumidity1000HPa,
  };

  @override
  List<Object?> get props => [
    time, temperature2M, relativeHumidity2M, apparentTemperature, precipitationProbability, rain, snowfall, weatherCode, visibility, windSpeed10M, temperature80M, uvIndex, temperature1000HPa, relativeHumidity1000HPa, ];
}
