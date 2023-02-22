import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class MediaBox extends StatelessWidget {
  const MediaBox({
    Key? key,
    required this.isVideo,
    required this.thumbnail,
    required this.url,
  }) : super(key: key);

  final bool isVideo;
  final String thumbnail;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => html.window.open(url, url),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://cdn.instadp.io/?url=${Uri.encodeComponent(thumbnail)}',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                      // child: CircularProgressIndicator(),
                      );
                },
                height: 400,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: isVideo,
              child: const Icon(
                Icons.play_circle,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
