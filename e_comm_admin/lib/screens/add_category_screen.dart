// ignore_for_file: prefer_is_empty, unnecessary_cast, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_const_constructors

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../controllers/category-images-controller.dart';
import '../models/categories_model.dart';
import '../services/generate-ids-service.dart';
import '../utils/constant.dart';

class AddCategoriesScreen extends StatefulWidget {
  const AddCategoriesScreen({super.key});

  @override
  State<AddCategoriesScreen> createState() => _AddCategoriesScreenState();
}

class _AddCategoriesScreenState extends State<AddCategoriesScreen> {
  TextEditingController categoryNameController = TextEditingController();
  AddCategoryImagesController addCategoryImagesController =
      Get.put(AddCategoryImagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstant.appTextColor,
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          'Add Categories',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Images"),
                    ElevatedButton(
                      onPressed: () {
                        addCategoryImagesController.showImagesPickerDialog();
                      },
                      child: const Text("Select Images"),
                    )
                  ],
                ),
              ),

              //show Images
              GetBuilder<AddCategoryImagesController>(
                init: AddCategoryImagesController(),
                builder: (imageController) {
                  return imageController.selectedIamges.length > 0
                      ? Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: Get.height / 3.0,
                          child: GridView.builder(
                            itemCount: imageController.selectedIamges.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Image.file(
                                    File(addCategoryImagesController
                                        .selectedIamges[index].path),
                                    fit: BoxFit.cover,
                                    height: Get.height / 4,
                                    width: Get.width / 2,
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 0,
                                    child: InkWell(
                                      onTap: () {
                                        imageController.removeImages(index);
                                        print(imageController
                                            .selectedIamges.length);
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor:
                                            AppConstant.appScendoryColor,
                                        child: Icon(
                                          Icons.close,
                                          color: AppConstant.appTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 40.0),
              Container(
                height: 65,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  cursorColor: AppConstant.appMainColor,
                  textInputAction: TextInputAction.next,
                  controller: categoryNameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    hintText: "Category Name",
                    hintStyle: TextStyle(fontSize: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  if (addCategoryImagesController.selectedIamges.isEmpty) {
                    Get.snackbar(
                      'Validation Error',
                      'Please select at least one image.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appScendoryColor,
                      colorText: AppConstant.appTextColor,
                    );
                    return;
                  }

                  if (categoryNameController.text.trim().isEmpty) {
                    Get.snackbar(
                      'Validation Error',
                      'Please enter a category name.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appScendoryColor,
                      colorText: AppConstant.appTextColor,
                    );
                    return;
                  }
                  EasyLoading.show();
                  await addCategoryImagesController.uploadFunction(
                      addCategoryImagesController.selectedIamges);
                  String categoryId = GenerateIds().generateCategoryId();
                  String cateImg = addCategoryImagesController.arrImagesUrl[0]
                      .toString() as String;

                  print(cateImg);

                  CategoriesModel categoriesModel = CategoriesModel(
                    categoryId: categoryId,
                    categoryName: categoryNameController.text.trim(),
                    categoryImg: cateImg,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  print(categoryId);

                  // //
                  FirebaseFirestore.instance
                      .collection('categories')
                      .doc(categoryId)
                      .set(categoriesModel.toJson());

                  EasyLoading.dismiss();

                  Get.back();
                  //await Get.offAll(() => AllCategoriesScreen());
                },
                child: const Text("Upload"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
