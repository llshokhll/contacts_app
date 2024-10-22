import 'package:contact_app/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(
      {Key? key,
      required this.iconPath,
      required this.contactName,
      required this.number,
      required this.whenClicked,
      required this.isSelected,
      required this.deleteClicked,
      required this.updateClicked,
      required this.onImageTap})
      : super(key: key);

  final String iconPath;
  final String contactName;
  final String number;
  final VoidCallback whenClicked;
  final VoidCallback deleteClicked;
  final VoidCallback updateClicked;
  final VoidCallback onImageTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenClicked,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 6,
                  offset: const Offset(0, 3),
                  color: Colors.grey.shade300)
            ]),
        child: Row(
          children: [
            GestureDetector(
              onTap: onImageTap,
              child: Image.asset(
                iconPath,
                width: 50.w,
                height: 50.h,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactName,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: isSelected ? Colors.red : MyColors.C_3B3B3B),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: deleteClicked,
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 24.r,
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
            ),
            TextButton(
              onPressed: updateClicked,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Icon(
                Icons.edit,
                color: Colors.blueAccent,
                size: 25.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
