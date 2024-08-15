import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/helper/utils/timeDateFormator.dart';

class FarmLocationProvider extends ChangeNotifier {
  late GoogleMapController gMapController;
  final List<LatLng> markers = [];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formattedDate = '';
  String formattedTime = '';

  void onMapCreated(GoogleMapController controller) {
    gMapController = controller;
  }

  void onTap(LatLng position) {
    markers.add(position);
    notifyListeners();
  }

  void clearMarkers() {
    markers.clear();
    notifyListeners();
  }

  Future<void> dateSelector(BuildContext context) async {
    selectedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (selectedDate != null) {
      formattedDate = TimeDateFormator.formateDateTime(selectedDate!);
      notifyListeners();
    }
  }

  Future<void> timeSelector(BuildContext context) async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(selectedTime != null){
      formattedTime = TimeDateFormator.formateTimeOfDay(selectedTime!);
      notifyListeners();
    }
  }

  void clearDatas(){
    markers.clear();
    selectedDate = null;
    selectedTime = null;
    formattedDate = '';
    formattedTime = '';
    notifyListeners();
  }
}
