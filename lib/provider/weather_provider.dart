import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/models/weather_model.dart';
import 'package:egrocer/repositories/open_weather_api._and_service.dart';

class WeatherProvider extends ChangeNotifier {
  final weatherService = OpenWeatherApiAndService();

  WeatherModel? weather;

  fechOpenWeather()async{
    String cityName = await weatherService.getCurrentCity();
    try {
      weather = await weatherService.getWeather(cityName);
      notifyListeners();
      print(weather.toString() + '-=-=-=-=');
    } catch (e) {
      throw e;
    }
  }
}