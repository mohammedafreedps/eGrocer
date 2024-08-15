import 'package:egrocer/helper/utils/generalImports.dart';
import 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/startButton.dart';
import 'package:egrocer/screens/mainHomeScreen/homeScreen/widget/weatherDisplay.dart';

getOfferImages(List<OfferImages>? offerImages, BuildContext context,
    {bool needWeatherDetail = false, bool needStartButton = false}) {
  return Stack(
    children: [
      Column(
          children: List.generate(
        offerImages!.length,
        (index) {
          return GestureDetector(
            onTap: () async {
              if (offerImages[index].type == "offer_url") {
                if (await canLaunchUrl(
                    Uri.parse(offerImages[index].offerUrl ?? ""))) {
                  await launchUrl(Uri.parse(offerImages[index].offerUrl ?? ""),
                      mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch ${offerImages[index].offerUrl}';
                }
              } else if (offerImages[index].type == "category") {
                Navigator.pushNamed(context, productListScreen, arguments: [
                  "category",
                  offerImages[index].typeId.toString(),
                  offerImages[index].typeName
                ]);
              } else if (offerImages[index].type == "product") {
                Navigator.pushNamed(context, productDetailScreen, arguments: [
                  offerImages[index].typeId.toString(),
                  offerImages[index].typeName,
                  null
                ]);
              }
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: Constant.size10,
                  end: Constant.size10,
                  top: Constant.size5,
                  bottom: Constant.size5),
              child: ClipRRect(
                borderRadius: Constant.borderRadius10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: setNetworkImg(
                    image: offerImages[index].imageUrl.toString(),
                    boxFit: BoxFit.fitHeight),
              ),
            ),
          );
        },
      )),
      needWeatherDetail ? weatherDisplay(context) : Container(),
      needStartButton ? startButton(context) : Container()
    ],
  );
}






