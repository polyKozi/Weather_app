import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:weather_forecast/main.dart';
import 'package:weather_forecast/models.dart';

class ApiConstants {
  static String currentWeatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=';
  static String dayWeatherUrl =
      'https://api.openweathermap.org/data/2.5/forecast?q=';
  static String APIkey = '&units=metric&appid=d42ab1d240d243640d5099b2a2e84996';
}

// List<CurrentWeather> currentWeatherListlFromJson(String str) =>
//     List<CurrentWeather>.from(
//         json.decode(str).map((x) => CurrentWeather.fromJson(x)));
//
// class CurrentWeather {
//   CurrentWeather({
//     required this.weather,
//     required this.main,
//   });
//
//   List<Weather> weather;
//   Main main;
//
//   factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
//         weather: List<Weather>.from(
//             json["weather"].map((model) => Weather.fromJson(model))),
//         main: Main.fromJson(json["main"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "weather": jsonEncode(weather),
//         "main": main.toJson(),
//       };
// }
//
// class Weather {
//   Weather({
//     required this.icon,
//   });
//
//   String icon;
//
//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         icon: json["icon"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "icon": icon,
//       };
// }
//
// class Main {
//   Main({
//     required this.temp,
//     required this.feelsLike,
//   });
//
//   num temp;
//   num feelsLike;
//
//   factory Main.fromJson(Map<String, dynamic> json) => Main(
//         temp: json["temp"],
//         feelsLike: json["feels_like"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "temp": temp,
//         "feels_like": feelsLike,
//       };
// }

class ApiServiceCurrentWeather {
  Future<CurrentWeather?> getCurrentWeather() async {
    try {
      var url = Uri.parse(ApiConstants.currentWeatherUrl +
          cities[cityIndex] +
          ApiConstants.APIkey);
      var response = await http.get(url);
      ;
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        CurrentWeather weather = CurrentWeather.fromJson(json);
        log(weather.toString());
        return weather;
      } else {
        log(response.statusCode.toString() + "R");
        return null;
      }
    } catch (e) {
      log(e.toString() + "EPS", error: e);
      return null;
    }
  }
}

// class DayWeather {
//   DayWeather({
//     required this.list,
//   });
//
//   List<PerHour> list;
//
//   factory DayWeather.fromJson(Map<String, dynamic> json) => DayWeather(
//         list: List<PerHour>.from(
//             json["list"].map((model) => PerHour.fromJson(model))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "list": jsonEncode(list),
//       };
// }
//
// class PerHour {
//   PerHour({
//     required this.weather,
//     required this.dtTxt,
//     required this.main,
//   });
//
//   List<Weather> weather;
//   String dtTxt;
//   Main main;
//
//   factory PerHour.fromJson(Map<String, dynamic> json) => PerHour(
//         weather: List<Weather>.from(
//             json["weather"].map((model) => Weather.fromJson(model))),
//         dtTxt: json["dt_txt"] as String,
//         main: Main.fromJson(json["main"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "weather": jsonEncode(weather),
//         "main": main,
//         "dt_txt": dtTxt,
//       };
// }

class ApiServiceDayWeather {
  Future<DayWeather?> getDayWeather() async {
    var url = Uri.parse(
        ApiConstants.dayWeatherUrl + cities[cityIndex] + ApiConstants.APIkey);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      DayWeather weather = DayWeather.fromJson(json);
      log(weather.toString());
      return weather;
    } else {
      log(response.statusCode.toString() + "R");
      return null;
    }
  }
}
