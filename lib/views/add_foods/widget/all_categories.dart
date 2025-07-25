import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_flutter/common/app_style.dart';
import 'package:restaurant_flutter/common/reusable_text.dart';
import 'package:restaurant_flutter/constants/constants.dart';
import 'package:restaurant_flutter/constants/uidata.dart';
import 'package:restaurant_flutter/controllers/food_controller.dart';

class ChooseCategory extends HookWidget {
  const ChooseCategory({super.key, required this.next});

  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 12.h, top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Pick Category",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                      "You need to pick a category to continue adding a food item",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];
                return ListTile(
                  onTap: () {
                    controller.setCategory = category['_id'];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kPrimary,
                    // child: Image.network(category['imageUr'], fit: BoxFit.cover),
                  ),
                  title: ReusableText(
                    text: category['title'],
                    style: appStyle(12, kGray, FontWeight.normal),
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: kGray,
                    size: 15.sp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
