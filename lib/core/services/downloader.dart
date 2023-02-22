// import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

// import 'package:dio/dio.dart';
// import 'package:insta_dp/core/error/exception.dart';

class Downlaoder {
  static Future<void> download(String url) async {
    window.open(url, url);
    // try {
    //   String urla = url.substring(0, url.indexOf('?'));

    //   String name = urla.substring(urla.lastIndexOf('/') + 1);
    //   var res = await Dio().get(
    //     'https://cdn.instadp.io/?url=${Uri.encodeComponent(url)}',
    //     options: Options(
    //       receiveTimeout: 0,
    //       followRedirects: false,
    //       responseType: ResponseType.bytes,
    //     ),
    //   );

    //   final rawData = res.data;
    //   final content = base64Encode(rawData);

    //   AnchorElement(
    //       href:
    //           "data:application/octet-stream;charset=utf-16le;base64,$content")
    //     ..setAttribute("download", name)
    //     ..click();
    // } on Exception catch (_) {
    //   throw ServerException(message: 'Failed to download');
    // }
  }
}
