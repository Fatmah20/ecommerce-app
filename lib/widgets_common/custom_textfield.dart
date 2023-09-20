import 'package:emart_firebase_app/consts/consts.dart';

Widget customTextField({String? title, String? hintText, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontFamily: semibold, color: textfieldGrey),
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redColor))),
      ),
      10.heightBox,
    ],
  );
}
