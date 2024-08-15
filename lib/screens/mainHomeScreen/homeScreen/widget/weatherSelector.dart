import 'package:egrocer/helper/utils/generalImports.dart';

Widget weatherSelector(String mainCondition) {
  switch (mainCondition.toLowerCase()) {
    case 'thunderstorm':
      return SvgPicture.asset(
        'assets/svg/thunder.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
    case 'fog':
      return SvgPicture.asset(
        'assets/svg/cloud.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
    case 'shower rain':
      return SvgPicture.asset(
        'assets/svg/rain.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
    case 'clear':
      return SvgPicture.asset(
        'assets/svg/sunny.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
    case 'clouds':
      return SvgPicture.asset(
        'assets/svg/cloud.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
    default:
      return SvgPicture.asset(
        'assets/svg/sunny.svg',
        width: 30,
        colorFilter: ColorFilter.mode(ColorsRes.appColorGreen, BlendMode.srcIn),
      );
  }
}