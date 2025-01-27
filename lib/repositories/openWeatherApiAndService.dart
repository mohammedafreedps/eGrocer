import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/models/weatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ;

class OpenWeatherApiAndService {
  static Position? currentPostition;
  Future<WeatherModel> getWeather(String cityName) async{
    final response = await http.get(Uri.parse('${Constant.openWeatherBaseUrl}?q=$cityName&appid=${ApiAndParams.openWeatherApi}&units=metric'));
    if(response.statusCode == 200){
      return WeatherModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load Weather data');
    }
  }

  Future<String> getCurrentCity()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
    currentPostition = position;
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city ?? '';
  }
}