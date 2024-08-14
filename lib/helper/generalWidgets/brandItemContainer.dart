import 'package:egrocer/helper/utils/generalImports.dart';

class BrandItemContainer extends StatelessWidget {
  final BrandItem? brand;
  final VoidCallback voidCallBack;

  const BrandItemContainer({Key? key, this.brand, required this.voidCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallBack,
      child: Container(
        decoration: DesignConfig.boxDecoration(Theme.of(context).cardColor, 8),
        child: Column(children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 5, end: 5, top: 5),
              child: SizedBox(
                height: context.width,
                width: context.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: setNetworkImg(
                    boxFit: BoxFit.cover,
                    image: brand?.imageUrl ?? "",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 4, end: 4),
                child: CustomTextLabel(
                  text: brand?.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}