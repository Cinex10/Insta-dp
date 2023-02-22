// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Dimension extends Equatable {
  final int height;
  final int width;
  const Dimension({
    required this.height,
    required this.width,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
        height: json['height'],
        width: json['width'],
      );

  @override
  String toString() {
    return '$width x $height';
  }

  @override
  List<Object> props() => [height, width];
}
