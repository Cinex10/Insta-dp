import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_bottom_app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Instadp tools',
      color: Colors.black,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(),
        ),
        body: Container(
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
                  'Contact us',
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
              Text(
                'contact-c1'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                width: (1.sw > 1000) ? 0.5.sw : 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TiltledText(
                      title: 'email'.tr(),
                      sub: 'instadptools@gmail.com',
                    ),
                    TiltledText(
                      title: 'phone-number'.tr(),
                      sub: '+201158058409',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                'contact-c2'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              //BOTTOM BAR
              const CustomBottomAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class TiltledText extends StatelessWidget {
  const TiltledText({
    Key? key,
    required this.title,
    required this.sub,
  }) : super(key: key);

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          sub,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
