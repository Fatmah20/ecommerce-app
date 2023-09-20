import 'package:emart_firebase_app/consts/consts.dart';

Widget homeButtons({String? title, icon, width, height, onPress}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
    ),
  ).box.rounded.size(width, height).shadowSm.white.make();
}
