// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteCardWidget extends StatefulWidget {
  String title;
  String desc;
  String date;
  bool? isMyTask = false;
  final VoidCallback? onPressedDeleteBtn;
  final VoidCallback? onPressedeEditBtn;

  NoteCardWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.date,
    this.isMyTask,
    this.onPressedDeleteBtn,
    this.onPressedeEditBtn,
  });

  @override
  State<NoteCardWidget> createState() => _NoteCardWidgetState();
}

class _NoteCardWidgetState extends State<NoteCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              widget.isMyTask == true
                  ? Row(
                    children: [
                      InkWell(
                        onTap: widget.onPressedeEditBtn,
                        child: Icon(
                          Icons.edit_note_outlined,
                          size: 26,
                          color: Colors.green,
                        ),
                      ),
                      InkWell(
                        onTap: widget.onPressedDeleteBtn,
                        child: Icon(
                          Icons.delete_outline,
                          size: 24,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                  : Container(),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.desc,
            maxLines: null,
            overflow: TextOverflow.visible,
            //Farklı sayfaya yönlendirme de yapabilirdim fakat akışta notlar tam olarak görünsün istedim
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
          alignment: Alignment.bottomRight,
          child: Text(
            widget.date,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ),
        SizedBox(height: 5),
        Divider(height: 1),
      ],
    );
  }
}
