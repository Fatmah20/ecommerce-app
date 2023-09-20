import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: darkFontGrey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: darkFontGrey,
                )),
          ],
          title: title!.text.color(darkFontGrey).fontFamily(semibold).make(),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    title!.text.size(16).fontFamily(semibold).make(),
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: const Color.fromARGB(255, 250, 227, 18),
                      count: 5,
                      size: 25,
                      stepInt: true,
                      // maxRating: 5,
                    ),
                    10.heightBox,
                    "\$30.00"
                        .text
                        .color(redColor)
                        .fontFamily(semibold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.size(12).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child:
                              Icon(Icons.message_rounded, color: darkFontGrey),
                        ),
                      ],
                    )
                        .box
                        .color(textfieldGrey)
                        .padding(const EdgeInsets.all(8))
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: "Color : "
                                    .text
                                    .color(textfieldGrey)
                                    .make()),
                            Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.all(4))
                                      .roundedFull
                                      .make()),
                            )
                          ],
                        ).box.white.padding(const EdgeInsets.all(10)).make(),
                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: "Quantity : "
                                    .text
                                    .color(textfieldGrey)
                                    .make()),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                    )),
                                "0"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                    )),
                                10.widthBox,
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.white.padding(const EdgeInsets.all(10)).make(),
                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: "Total : "
                                    .text
                                    .color(textfieldGrey)
                                    .make()),
                            "\$0.00"
                                .text
                                .fontFamily(semibold)
                                .color(redColor)
                                .make()
                          ],
                        ).box.white.padding(const EdgeInsets.all(10)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    10.heightBox,
                    "Description : ".text.color(darkFontGrey).make(),
                    10.heightBox,
                    "This ia a dummy item and dummy description here.."
                        .text
                        .color(darkFontGrey)
                        .make(),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          5,
                          (index) => ListTile(
                                title: itemDetailsBouttonsList[index]
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),
                    20.heightBox,
                    productsYouMayAlsoLiike.text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                  textcolor: whiteColor,
                  title: "Add to cart",
                  bgColor: redColor,
                  onPress: () {}),
            )
          ],
        ).box.white.make());
  }
}
