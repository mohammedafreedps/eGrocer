import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/models/weatherModel.dart';
import 'package:egrocer/repositories/openWeatherApiAndService.dart';

class WeatherProvider extends ChangeNotifier {
  final weatherService = OpenWeatherApiAndService();

  WeatherModel? weather;

  fechOpenWeather()async{
    String cityName = await weatherService.getCurrentCity();
    try {
      weather = await weatherService.getWeather(cityName);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}