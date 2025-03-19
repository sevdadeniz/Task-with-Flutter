// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NormalButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  String text;

  NormalButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  State<NormalButtonWidget> createState() => _NormalButtonWidgetState();
}

class _NormalButtonWidgetState extends State<NormalButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(50), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          50,
        ), 
        child: Container(
          height: 50,
          width: 150,
          alignment: Alignment.center,
          color: Colors.deepPurple, 
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
