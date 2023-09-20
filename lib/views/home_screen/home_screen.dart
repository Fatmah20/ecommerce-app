import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/views/home_screen/components/featured_button.dart';
import 'package:emart_firebase_app/widgets_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      padding: const EdgeInsets.all(12),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: searchanything,
                    filled: true,
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    fillColor: whiteColor,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, inddex) {
                          return Image.asset(
                            slidersList[inddex],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .clip(Clip.antiAlias)
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButtons(
                                title: index == 0 ? todayDeal : flashSale,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.5,
                              )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        height: 150,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secondSliderList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .clip(Clip.antiAlias)
                              .rounded
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                                title: index == 0
                                    ? topCategories
                                    : index == 1
                                        ? brand
                                        : topSeller,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                width: context.screenWidth / 3.5,
                                height: context.screenHeight * .15,
                              )),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .size(18)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featuredButton(
                                          icon: featuredImage1[index],
                                          title: featuredTitle1[index]),
                                      10.heightBox,
                                      featuredButton(
                                          icon: featuredImage2[index],
                                          title: featuredTitle2[index])
                                    ],
                                  )).toList()),
                    ),
                    20.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text
                            .size(18)
                            .white
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        10.heightBox,
                                        "Laptop 4GB/64GB"
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                        10.heightBox,
                                        "\$600"
                                            .text
                                            .fontFamily(semibold)
                                            .color(redColor)
                                            .size(16)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .rounded
                                        .padding(const EdgeInsets.all(8))
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .make()),
                          ),
                        )
                      ],
                    )
                        .box
                        .color(redColor)
                        .padding(const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10))
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make(),
                    10.heightBox,
                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        height: 150,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secondSliderList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 250),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP5,
                                width: 200,
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                              const Spacer(),
                              "Laptop 4GB/64GB"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              "\$600"
                                  .text
                                  .fontFamily(semibold)
                                  .color(redColor)
                                  .size(16)
                                  .make(),
                              20.heightBox
                            ],
                          )
                              .box
                              .white
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 8))
                              .roundedSM
                              .make();
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
