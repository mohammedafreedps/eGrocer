import 'package:egrocer/helper/styles/colorsRes.dart';
import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/provider/farm_location_provider.dart';
import 'package:egrocer/repositories/open_weather_api._and_service.dart';
import 'package:flutter/material.dart';

class FarmLocationFillScreen extends StatelessWidget {
  const FarmLocationFillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsRes.bgColorLight,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            setButtons(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => GMap()));
            }, context.width, context.height * 0.05, 'Mark Plot'),
            context.watch<FarmLocationProvider>().markers.isNotEmpty
                ? Flexible(flex: 1, child: markedMarkerPostitions(context))
                : SizedBox(
                    height: 30,
                  ),
            Flexible(
                child: setButtons(() {
              bottomSelectorSheet(context);
            }, context.width, context.height * 0.05, 'Schedule soil pickup')),
            SizedBox(height: 20,),
            Text('Time: ' + context.watch<FarmLocationProvider>().formattedTime,style: TextStyle(color: Colors.grey),),
            SizedBox(height: 20,),
            Text('Date: ' + context.watch<FarmLocationProvider>().formattedDate,style: TextStyle(color: Colors.grey),),
            SizedBox(height: 20,),
            Flexible(
              flex: 0,
              child: setButtons((){
                context.read<FarmLocationProvider>().clearDatas();
                Navigator.pop(context);
              }, context.width, context.height * 0.05, 'Save'),
            )
          ],
        ),
      ),
    );
  }
}

class GMap extends StatelessWidget {
  const GMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsRes.bgColorLight,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: context.read<FarmLocationProvider>().onMapCreated,
            initialCameraPosition: CameraPosition(
                zoom: 14.4746,
                target: LatLng(
                    OpenWeatherApiAndService.currentPostition!.latitude,
                    OpenWeatherApiAndService.currentPostition!.longitude)),
            markers: context
                .watch<FarmLocationProvider>()
                .markers
                .map((marker) => Marker(
                    markerId: MarkerId(marker.toString()), position: marker))
                .toSet(),
            polygons: context.watch<FarmLocationProvider>().markers.length > 2
                ? {
                    Polygon(
                        polygonId: PolygonId(
                          'geoFencePolygon',
                        ),
                        points: context.watch<FarmLocationProvider>().markers,
                        strokeWidth: 2,
                        strokeColor: ColorsRes.gradient1,
                        fillColor: ColorsRes.gradient1.withOpacity(0.3)),
                  }
                : {},
            onTap: context.read<FarmLocationProvider>().onTap,
            myLocationEnabled: true,
          ),
          Container(
            height: context.height * 0.1,
            child: Align(
              child: TextButton.icon(
                  onPressed: () {
                    context.read<FarmLocationProvider>().clearMarkers();
                  },
                  label: Column(
                    children: [
                      Icon(Icons.cleaning_services),
                      Text('Clear all Markers')
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

Widget markedMarkerPostitions(BuildContext context) {
  return ListView.builder(
      itemCount: context.watch<FarmLocationProvider>().markers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            context
                .watch<FarmLocationProvider>()
                .markers[index]
                .toString()
                .replaceAll(
                  'LatLng',
                  'Marker ${index + 1} ',
                ),
            style: TextStyle(color: Colors.grey),
          ),
        );
      });
}

Widget setButtons(
    Function function, double width, double height, String label) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorsRes.appColorGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Future<void> bottomSelectorSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: context.height * 0.2,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              setButtons(() {
                context.read<FarmLocationProvider>().dateSelector(context);
              }, context.width, 50, context.watch<FarmLocationProvider>().formattedTime.isNotEmpty
                      ? context.watch<FarmLocationProvider>().formattedDate
                      : 'Selected Date'),
              SizedBox(
                height: 30,
              ),
              setButtons(() {
                context.read<FarmLocationProvider>().timeSelector(context);
              },
                  context.width,
                  50,
                  context.watch<FarmLocationProvider>().formattedTime.isNotEmpty
                      ? context.watch<FarmLocationProvider>().formattedTime
                      : 'Selected Time'),
            ],
          ),
        );
      });
}
