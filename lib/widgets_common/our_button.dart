import 'package:emart_firebase_app/consts/consts.dart';

Widget ourButton({onPress, String? title, Color? textcolor, Color? bgColor}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor, padding: const EdgeInsets.all(12)),
      onPressed: onPress,
      child: title!.text.color(textcolor).fontFamily(bold).make());
}
