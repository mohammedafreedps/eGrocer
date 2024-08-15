import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/screens/farm_location_fill_screen/farmLocationFillScreen.dart';

Widget startButton(BuildContext context) {
  return Align(
    alignment: AlignmentDirectional.topEnd,
    child: Padding(
      padding: EdgeInsets.only(
          top: context.height * 0.032, right: context.width * 0.09),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FarmLocationFillScreen()));
        },
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 114, 113, 113)
                        .withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 0), // changes position of shadow (x, y)
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 48, 130, 52)),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Start',
              style: TextStyle(color: Colors.white),
            )),
      ),
    ),
  );
}