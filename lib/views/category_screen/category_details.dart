import 'package:emart_firebase_app/consts/consts.dart';
import 'package:emart_firebase_app/controllers/product_controller.dart';
import 'package:emart_firebase_app/views/category_screen/item_details.dart';
import 'package:emart_firebase_app/widgets_common/bg_wigdet.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    6,
                    (index) => categoriesList[index]
                        .text
                        .color(darkFontGrey)
                        .size(4)
                        .fontFamily(semibold)
                        .makeCentered()
                        .box
                        .white
                        .size(120, 60)
                        .rounded
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        .padding(const EdgeInsets.symmetric(horizontal: 8))
                        .roundedSM
                        .make()
                        .onTap(() {
                      Get.to(() => ItemDetails(title: "title item"));
                    });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
