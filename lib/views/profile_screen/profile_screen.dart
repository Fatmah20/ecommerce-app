import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/controllers/auth_controller.dart';
import 'package:emart_firebase_app/controllers/profile_controller.dart';
import 'package:emart_firebase_app/services/firestore_services.dart';
import 'package:emart_firebase_app/views/auth_screen/login_screen.dart';
import 'package:emart_firebase_app/views/profile_screen/components/details_card.dart';
import 'package:emart_firebase_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_firebase_app/widgets_common/bg_wigdet.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];

            return SafeArea(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      )),
                ).onTap(() {
                  controller.nameController.text = data['name'];
                  // controller.passwordController.text = data['password'];

                  Get.to(() => EditProfileScreen(
                        data: data,
                      ));
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      data['imageUrl'] == ''
                          ? Image.asset(
                              imgProfile,
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.network(
                              data['imageUrl'],
                              width: 70,
                              fit: BoxFit.cover,
                            )
                              .box
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${data['name']}"
                              .text
                              .white
                              .fontFamily(semibold)
                              .make(),
                          "${data['email']}".text.size(12).white.make(),
                        ],
                      )),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: whiteColor)),
                        onPressed: () async {
                          await Get.put(AuthController())
                              .singoutMethod(context);
                          Get.off(() => const LoginScreen());
                        },
                        child: "logout".text.fontFamily(semibold).white.make(),
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(
                        width: context.screenWidth / 3.4,
                        count: data['cart_count'],
                        title: "in your cart"),
                    detailsCard(
                        width: context.screenWidth / 3.4,
                        count: data['wishlist_count'],
                        title: "in your WishList"),
                    detailsCard(
                        width: context.screenWidth / 3.4,
                        count: data['order_count'],
                        title: " your Orders"),
                  ],
                ),
                ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: lightGrey,
                          );
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonsIcon[index],
                              width: 30,
                              height: 30,
                            ),
                            title: profileButtonsList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        })
                    .box
                    .white
                    .padding(const EdgeInsets.symmetric(horizontal: 16))
                    .margin(const EdgeInsets.all(12))
                    .shadowSm
                    .rounded
                    .make()
                    .box
                    .color(redColor)
                    .make(),
              ]),
            );
          }
        },
      )),
    );
  }
}
