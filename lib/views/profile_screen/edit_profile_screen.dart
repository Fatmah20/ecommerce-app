import 'dart:io';

import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/controllers/profile_controller.dart';
import 'package:emart_firebase_app/widgets_common/bg_wigdet.dart';
import 'package:emart_firebase_app/widgets_common/custom_textfield.dart';
import 'package:emart_firebase_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    // controller.passwordController.text = data['password'];

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if data image url and controller path is empty
              data['imageUrl'] == ' ' && controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()

                  // if data is not empty controller path is empty

                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()

                      // if  both are empty
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              ourButton(
                onPress: () {
                  controller.changeImage(context);
                },
                bgColor: redColor,
                textcolor: whiteColor,
                title: "change",
              ),
              const Divider(),
              20.heightBox,
              customTextField(
                  title: name,
                  hintText: nameHint,
                  isPass: false,
                  controller: controller.nameController),
              customTextField(
                  title: oldpass,
                  hintText: passwordHint,
                  isPass: true,
                  controller: controller.oldpasswordController),

              customTextField(
                  title: newpass,
                  hintText: passwordHint,
                  isPass: true,
                  controller: controller.newpasswordController),

              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 50,
                      child: ourButton(
                        onPress: () async {
                          controller.isloading(true);

                          //if image is not selscted
                          if (controller.profileImgPath.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }

//if old password matches data base
                          if (data['password'] ==
                              controller.oldpasswordController.text) {
                            await controller.changeAuthPasswors(
                              email: data['email'],
                              password: controller.oldpasswordController.text,
                              newpassword:
                                  controller.newpasswordController.text,
                            );

                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpasswordController.text,
                            );

                            VxToast.show(context, msg: "Updated");
                          } else {
                            VxToast.show(context, msg: "Worng old password");
                            controller.isloading(false);
                          }
                        },
                        bgColor: redColor,
                        textcolor: whiteColor,
                        title: "save",
                      ),
                    )
            ],
          )
              .box
              .white
              .shadowSm
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.all(12))
              .make(),
        ),
      ),
    ));
  }
}
