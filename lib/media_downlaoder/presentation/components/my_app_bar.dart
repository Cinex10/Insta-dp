import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        'LOGO',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
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
        const SizedBox(
          width: 20,
        ),
        const Center(
          child: Text(
            'title2',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Center(
          child: Text(
            'title3',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
