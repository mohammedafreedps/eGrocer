import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/provider/weather_provider.dart';
import 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/weatherSelector.dart';

Widget weatherDisplay(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding:  EdgeInsets.only(left: context.width * 0.03, top: context.height * 0.016),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on,color: ColorsRes.activeRatingColor,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.watch<WeatherProvider>().weather?.cityName ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: ColorsRes.appColorGreen),),
                Text(context.watch<WeatherProvider>().weather?.mainCondition ?? 
                    '',style: TextStyle(fontSize: 12,color: ColorsRes.appColorGreen),),
                Text(context
                        .watch<WeatherProvider>()
                        .weather
                        ?.temperature
                        .round()
                        .toString() ??
                    '',style: TextStyle(fontSize: 12,color: ColorsRes.appColorGreen),),
              ],
            ),
            weatherSelector(context.watch<WeatherProvider>().weather?.mainCondition ?? '')
          ],
        ),
      ),
    ),
  );
}

// ColorsRes.mainTextColor