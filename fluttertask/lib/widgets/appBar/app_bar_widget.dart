// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? centerTitle;
  bool? implyLeading;
  Widget? actions;
  String? fontFamily;
  double? fontSize = 20;
  FontWeight? fontWeight;

  AppbarWidget({
    Key? key,
    this.title,
    this.centerTitle,
    this.implyLeading,
    this.actions,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: implyLeading ?? false,
      leadingWidth: 30,
      toolbarHeight: preferredSize.height,
      title: Text(
        title ?? "",
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      ),
      centerTitle: centerTitle ?? false,
      actions: [actions ?? Container()],
    );
  }
}
