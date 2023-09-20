import 'package:emart_firebase_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(semibold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.size(12).make()
    ],
  ).box.white.rounded.padding(EdgeInsets.all(4)).width(width).height(60).make();
}
