// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

import 'package:insta_dp/core/models/faq.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    Key? key,
    required this.faq,
    // required this.question,
    // required this.children,
  }) : super(key: key);

  final FAQ faq;
  // final String question;
  // final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ExpansionTile(
          collapsedBackgroundColor: const Color.fromARGB(16, 0, 0, 0),
          backgroundColor: const Color.fromARGB(16, 0, 0, 0),
          tilePadding: const EdgeInsets.all(20),
          childrenPadding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 10,
          ),
          title: Text(
            faq.question,
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 56, 100),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          children: childrenFromJson(
              faq.answer, Alignment.centerLeft, TextAlign.start),
        ),
      ),
    );
  }
}

List<Widget> childrenFromJson(
    Map<String, String> data, Alignment alignment, TextAlign textAlign) {
  return List<Widget>.from(data.entries.map((e) {
    return (e.key.contains('text'))
        ? Align(
            alignment: alignment,
            child: StyledText(
              text: e.value,

              // textScaleFactor: 1.2,

              textAlign: textAlign,
              tags: {
                'bold': StyledTextTag(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              }..addAll({
                  for (var element in List.generate(21, (index) => index))
                    element.toString(): StyledTextTag(
                      style: TextStyle(
                        fontSize: element.toDouble(),
                      ),
                    )
                }),
              // textAlign: TextAlign.start,
            ),
          )
        : DropShadow(
            borderRadius: 13,
            child: Image.asset(e.value),
          );
  }));
}
