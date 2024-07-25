import 'package:contact_app/models/my_contact_data.dart';
import 'package:contact_app/utils/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key, required this.myContactInfo}) : super(key: key);
  final MyContactInfo myContactInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              myContactInfo.aboutInfo,
              style: MyTextStyles.oswaldBold700.copyWith(fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
