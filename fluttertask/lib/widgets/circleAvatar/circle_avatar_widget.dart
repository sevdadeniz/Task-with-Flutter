// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleAvatarWidget extends StatelessWidget {
  double radius;
  String imageUrl;
  CircleAvatarWidget({
    super.key,
    required this.radius,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imageUrl),
    );
  }
}
