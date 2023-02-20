import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerceproject/authentication/admin/admin_services.dart';
import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:ecommerceproject/shared/widgets/util.dart';
import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  TextEditingController productName = TextEditingController();

  TextEditingController productDes = TextEditingController();

  TextEditingController productCateg = TextEditingController();

  TextEditingController productPrice = TextEditingController();

  TextEditingController productQ = TextEditingController();
  AdminServices adminServices = AdminServices();
  final formKey = GlobalKey<FormState>();
  String category = 'Mobiles';
  List<File> images = [];
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    adminServices.sellProduct(
        context: context,
        name: productName.text,
        description: productDes.text,
        price: double.parse(productPrice.text),
        quantity: double.parse(productQ.text),
        category: category,
        images: images);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar("Add New Product", null),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Product Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                _buildTextFormField('Product Name', productName, 1),
                const SizedBox(
                  height: 10,
                ),
                _buildTextFormField('Product Description', productDes, 7),
                const SizedBox(
                  height: 15,
                ),
                _buildTextFormField('Price', productPrice, 1),
                const SizedBox(
                  height: 15,
                ),
                _buildTextFormField('Quantity', productQ, 1),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: const Text(
                          "Product Category:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "alef",
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: productCategories
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: category,
                            onChanged: (value) {
                              setState(() {
                                category = value as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              size: 20,
                            ),
                            iconSize: 16,
                            iconEnabledColor: Colors.black,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: Colors.grey.shade300,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 200,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.grey.shade300,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate() &&
                          images.isNotEmpty) {
                        sellProduct();
                      }
                    }),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String hintText, TextEditingController controller, int max) {
    return TextFormField(
      validator: (String? text) {
        if (controller.text == '') {
          return 'This Field is Required.';
        }
      },
      maxLines: max,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromRGBO(4, 131, 153, 1),
          ),
        ),
        enabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
