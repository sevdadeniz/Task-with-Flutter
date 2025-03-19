import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  String titleTextField;
  int? maxLines = 1;
  final TextEditingController controller;

  TextFieldWidget({
    super.key,
    required this.titleTextField,
    this.maxLines,
    required this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titleTextField, style: TextStyle(fontSize: 15)),
        SizedBox(height: 3),
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
