import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/core/utils/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      title: SizedBox(
        height: 40,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, Routes.homeScreen),
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        if (1.sw > 700)
          Center(
            child: InkWell(
              onTap: () {},
              child: const Text(
                'title1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        if (1.sw > 700)
          const SizedBox(
            width: 20,
          ),
        if (1.sw > 700)
          const Center(
            child: Text(
              'title2',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        if (1.sw > 700)
          const SizedBox(
            width: 20,
          ),
        if (1.sw > 700)
          const Center(
            child: Text(
              'title3',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        if (1.sw > 700)
          const SizedBox(
            width: 20,
          ),
        if (1.sw <= 700)
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Material(
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      color: Colors.white,
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'title1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'title2',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'title3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
      ],
    );
  }
}
