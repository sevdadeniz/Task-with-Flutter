// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertask/models/note_model.dart';
import 'package:fluttertask/providers/note_provider.dart';
import 'package:fluttertask/widgets/appBar/app_bar_widget.dart';
import 'package:fluttertask/widgets/buttons/normal_button_widget.dart';
import 'package:fluttertask/widgets/textField/text_field_widget.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  final Note? note;
  final bool isEditMode;
  final int? index;

  const AddNoteScreen({
    super.key,
    this.note,
    required this.isEditMode,
    this.index,
  });

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController controllerTitleTexfield = TextEditingController();
  final TextEditingController controllerDescTexfield = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditMode && widget.note != null) {
      controllerTitleTexfield.text = widget.note!.title;
      controllerDescTexfield.text = widget.note!.desc;
    }
  }

  void _addOrUpdateNote() {
    final String title = controllerTitleTexfield.text;
    final String desc = controllerDescTexfield.text;

    if (title.isNotEmpty && desc.isNotEmpty) {
      final note = Note.withCurrentDate(title: title, desc: desc);

      if (widget.isEditMode && widget.index != null) {
        Provider.of<NoteProvider>(
          context,
          listen: false,
        ).editNote(widget.index!, note);
      } else {
        Provider.of<NoteProvider>(context, listen: false).addNote(note);
      }

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lütfen tüm alanları doldurun')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppbarWidget(
        title: widget.isEditMode ? "Notu Güncelle" : "Not Oluştur",
        implyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWidget(
                controller: controllerTitleTexfield,
                titleTextField: 'Başlık',
              ),
              TextFieldWidget(
                controller: controllerDescTexfield,
                titleTextField: 'Açıklama',
                maxLines: 8,
              ),
              SizedBox(height: 100),
              NormalButtonWidget(
                onPressed: _addOrUpdateNote,
                text: widget.isEditMode ? 'Güncelle' : 'Notu ekle',
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
