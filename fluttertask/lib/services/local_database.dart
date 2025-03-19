import 'package:fluttertask/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteService {
  // ignore: constant_identifier_names
  static const String notes_list = 'notes';

  static Future<void> saveNotes(List<Note> notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesJson =
        notes.map((note) => json.encode(note.toMap())).toList();
    await prefs.setStringList(notes_list, notesJson);
  }

  static Future<List<Note>> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notesJson = prefs.getStringList(notes_list);
    if (notesJson == null) return [];
    return notesJson.map((noteStr) {
      return Note.fromMap(json.decode(noteStr));
    }).toList();
  }

  static Future<void> deleteNote(int index, List<Note> notes) async {
    notes.removeAt(index);
    await saveNotes(notes);
  }
}
