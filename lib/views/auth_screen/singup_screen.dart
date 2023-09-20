import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/controllers/auth_controller.dart';
import 'package:emart_firebase_app/views/home_screen/home.dart';
import 'package:emart_firebase_app/widgets_common/applogo_widget.dart';
import 'package:emart_firebase_app/widgets_common/bg_wigdet.dart';
import 'package:emart_firebase_app/widgets_common/custom_textfield.dart';
import 'package:emart_firebase_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

//text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
          15.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(
                    title: name,
                    hintText: nameHint,
                    controller: nameController,
                    isPass: false),
                customTextField(
                    title: email,
                    hintText: emailHint,
                    controller: emailController,
                    isPass: false),
                customTextField(
                    title: password,
                    hintText: passwordHint,
                    controller: passwordController,
                    isPass: true),
                customTextField(
                    title: retypePassword,
                    hintText: passwordHint,
                    controller: passwordRetypeController,
                    isPass: true),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: whiteColor,
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.heightBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termAndcond,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacyPolicy,
                            style:
                                TextStyle(fontFamily: regular, color: redColor))
                      ])),
                    ),
                  ],
                ),
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : ourButton(
                        onPress: () async {
                          if (isCheck != false) {
                            controller.isLoading(true);
                            try {
                              await controller
                                  .singupMethod(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text);
                              }).then((value) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isLoading(false);
                            }
                          }
                        },
                        bgColor: isCheck == true ? redColor : lightGrey,
                        textcolor: whiteColor,
                        title: singup,
                      ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(
                        fontFamily: (semibold),
                        color: fontGrey,
                      ),
                    ),
                    TextSpan(
                      text: login,
                      style: TextStyle(
                        fontFamily: (semibold),
                        color: redColor,
                      ),
                    ),
                  ]),
                ).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .width(context.screenWidth - 70)
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .make(),
          ),
        ],
      )),
    ));
  }
}
