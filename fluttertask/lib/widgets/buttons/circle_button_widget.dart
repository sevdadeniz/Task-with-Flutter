// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleButtonWidget extends StatefulWidget {
  IconData icon;
  final VoidCallback? onPressed;
  Color? buttonColor;
  Color? iconColor;
  // ignore: use_super_parameters
  CircleButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
  }) : super(key: key);

  @override
  State<CircleButtonWidget> createState() => _CircleButtonWidgetState();
}

class _CircleButtonWidgetState extends State<CircleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.buttonColor ?? Colors.transparent,
      radius: 20,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(widget.icon, size: 25),
        color: widget.iconColor ?? Colors.black,
        onPressed: widget.onPressed,
      ),
    );
  }
}
