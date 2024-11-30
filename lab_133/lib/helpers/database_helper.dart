import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_133/models/note.dart';

class DatabaseHelper {
  static const String _boxName = 'notesBox';

  Future<void> initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter()); // Реєструємо адаптер для моделі
    await Hive.openBox<Note>(_boxName);
  }

  Future<void> insertNote(Note note) async {
    final box = Hive.box<Note>(_boxName);
    await box.add(note);
  }

  List<Note> getNotes() {
    final box = Hive.box<Note>(_boxName);
    return box.values.toList();
  }

  Future<void> deleteNoteAt(int index) async {
    final box = Hive.box<Note>(_boxName);
    await box.deleteAt(index);
  }
}
