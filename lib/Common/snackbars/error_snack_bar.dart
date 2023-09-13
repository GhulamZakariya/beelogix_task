import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';






void errorSnackbar(BuildContext context, Widget message) {
  final snackBar = SnackBar(
    padding: EdgeInsets.only(left: 5.sp),
    clipBehavior: Clip.hardEdge,
    content: Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: const Icon(
              Icons.highlight_off_rounded,
              color: Colors.red,
            ),
          ),
          SizedBox(
            child: message,
            width: Get.width / 1.5,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
            ),
          )
        ],
      ),
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
