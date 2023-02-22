import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_dp/core/utils/routes.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  final Map<String, String> lang = {
    'en': 'English',
    'fr': 'Français',
    'de': 'Deutch',
    'es': 'Espanol',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'pl': 'Polski',
    'tr': 'Turkish'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: 1.sw,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black26,
            width: 0.4,
          ),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'bottom-text'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (1.sw > 800)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      // fit: BoxFit.fitWidth,
                      child: Text(
                        'right-reserved'.tr(),
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.policyScreen);
                            },
                            child: Text(
                              'privacy-policy-text'.tr(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        FittedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.termsScreen);
                            },
                            child: Text(
                              'terms-text'.tr(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        FittedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.contactScreen);
                            },
                            child: Text(
                              'contact-text'.tr(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        const VerticalDivider(
                          endIndent: 1,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.language,
                                size: 17,
                              ),
                              DropdownButton<String>(
                                borderRadius: BorderRadius.circular(14),
                                underline: const Text(''),
                                icon: const Text(''),
                                value: context.locale.languageCode,
                                items: List.from(
                                  lang.entries.map(
                                    (e) => DropdownMenuItem(
                                      value: e.key,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            e.value,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    context.setLocale(Locale(value ?? 'fr'));
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (1.sw <= 800)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1.sw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(14),
                              underline: const Text(''),
                              value: context.locale.languageCode,
                              icon: const Icon(
                                Icons.language,
                                size: 17,
                              ),
                              items: List.from(
                                lang.entries.map(
                                  (e) => DropdownMenuItem(
                                    value: e.key,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/flags/${e.key}.svg',
                                          width: 23,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          e.value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  context.setLocale(Locale(value ?? 'fr'));
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          FittedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.policyScreen);
                              },
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          FittedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.termsScreen);
                              },
                              child: const Text(
                                'Terms of Service',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          FittedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.contactScreen);
                              },
                              child: const Text(
                                'Contact us',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const VerticalDivider(
                            endIndent: 1,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const FittedBox(
                      // fit: BoxFit.fitWidth,
                      child: Text(
                        'InstaDP © 2022. All Rights Reserved.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
