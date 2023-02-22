import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_expansion_tile.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    Key? key,
    required this.dataPath,
    required this.contentLength,
  }) : super(key: key);

  final String dataPath;
  final int contentLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: (1.sw > 576) ? 0.1.sw : 0.05.sw),
      child: Column(
        children: childrenFromJson({
          for (var element in List.generate(contentLength, (index) => index))
            'text$element': '$dataPath-c$element'.tr()
        }, Alignment.center, (1.sw > 700) ? TextAlign.start : TextAlign.center),
      ),
    );
  }
}
