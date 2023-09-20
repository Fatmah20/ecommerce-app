import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/controllers/auth_controller.dart';
import 'package:emart_firebase_app/views/auth_screen/singup_screen.dart';
import 'package:emart_firebase_app/views/home_screen/home.dart';
import 'package:emart_firebase_app/widgets_common/applogo_widget.dart';
import 'package:emart_firebase_app/widgets_common/bg_wigdet.dart';
import 'package:emart_firebase_app/widgets_common/custom_textfield.dart';
import 'package:emart_firebase_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                    title: email,
                    hintText: emailHint,
                    isPass: false,
                    controller: controller.emailController),
                customTextField(
                    title: password,
                    hintText: passwordHint,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPass.text.make(),
                  ),
                ),
                5.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : ourButton(
                        bgColor: redColor,
                        onPress: () async {
                          controller.isLoading(true);

                          await controller
                              .loginMethod(context: context)
                              .then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            } else {
                              controller.isLoading(false);
                            }
                          });
                        },
                        textcolor: whiteColor,
                        title: login,
                      ).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                  onPress: () {
                    Get.to(() => const SingUpScreen());
                  },
                  bgColor: golden,
                  textcolor: redColor,
                  title: singup,
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: lightGrey,
                              child: Image.asset(
                                socailIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                )
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
