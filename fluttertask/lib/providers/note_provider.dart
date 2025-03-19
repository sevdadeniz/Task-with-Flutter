import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedNotes = prefs.getStringList('notes');

    if (savedNotes != null) {
      _notes =
          savedNotes.map((note) {
            final Map<String, dynamic> noteMap = Map.from(jsonDecode(note));
            return Note.fromMap(noteMap);
          }).toList();
    }

    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    final prefs = await SharedPreferences.getInstance();
    final String noteJson = jsonEncode(note.toMap());

    List<String>? savedNotes = prefs.getStringList('notes') ?? [];
    savedNotes.insert(0, noteJson); 

    await prefs.setStringList('notes', savedNotes);
    _notes.insert(0, note); 

    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedNotes = prefs.getStringList('notes') ?? [];

    savedNotes!.removeAt(index);
    await prefs.setStringList('notes', savedNotes);

    _notes.removeAt(index);

    notifyListeners();
  }

  Future<void> editNote(int index, Note updatedNote) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedNotes = prefs.getStringList('notes') ?? [];

    savedNotes![index] = jsonEncode(updatedNote.toMap());
    await prefs.setStringList('notes', savedNotes);

    _notes[index] = updatedNote;

    notifyListeners();
  }
}
