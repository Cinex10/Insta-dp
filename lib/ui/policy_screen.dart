import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_bottom_app_bar.dart';
import 'package:styled_text/styled_text.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Priva',
      color: Colors.black,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TITLE
                FittedBox(
                  child: Text(
                    'Privacy policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // height: 1.23,
                      color: Colors.black,
                      fontSize: (1.sw > 1000)
                          ? 80.r
                          : (1.sw > 700)
                              ? 120.r
                              : 130.r,

                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                //WRAP
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                      horizontal: (1.sw > 576) ? 0.15.sw : 0.04.sw),
                  child: StyledText(
                    text: "privacy-content".tr(),
                    tags: {
                      'bold': StyledTextTag(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      '20': StyledTextTag(
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      '16': StyledTextTag(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    },
                  ),
                ),

                //BOTTOM BAR
                const CustomBottomAppBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
