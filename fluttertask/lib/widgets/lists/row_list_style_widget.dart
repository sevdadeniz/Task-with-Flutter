// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowListStyleWidget extends StatefulWidget {
  String title;
  final VoidCallback? onPressed;
  RowListStyleWidget({super.key, required this.title, this.onPressed});

  @override
  State<RowListStyleWidget> createState() => _RowListStyleWidgetState();
}

class _RowListStyleWidgetState extends State<RowListStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Container(
            height: 50,

            margin: EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 14)),
                Icon(Icons.keyboard_arrow_right_outlined, size: 25),
              ],
            ),
          ),

          Divider(
            height: 1,
            endIndent: 10,
            indent: 10,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
