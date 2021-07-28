import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width, height;
  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular({
    this.width = double.infinity,
    @required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();
  ShimmerWidget.circular({
    this.width,
    this.height,
    this.shapeBorder = const CircleBorder(),
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.grey[200],
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Colors.grey,
        ),
      ),
    );
  }
}
