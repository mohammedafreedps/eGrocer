import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:intl/intl.dart';

class TimeDateFormator {
  static String formateTimeOfDay(TimeOfDay timeOfDay){
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('h:mm: a').format(DateTime(now.day,now.month,now.year,timeOfDay.hour,timeOfDay.hour));
    return formattedTime;
  }
  static String formateDateTime(DateTime dateTime){
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }
}