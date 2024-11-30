import 'package:flutter/material.dart';
import 'package:lab_133/helpers/database_helper.dart';
import 'package:lab_133/models/note.dart';
import 'package:intl/intl.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() {
    final notes = DatabaseHelper().getNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _addNote() async {
    if (_controller.text.isEmpty) {
      return;
    }

    final newNote = Note(
      text: _controller.text,
      date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
    );

    await DatabaseHelper().insertNote(newNote);
    _controller.clear();
    _loadNotes();
  }

  void _deleteNoteAt(int index) async {
    await DatabaseHelper().deleteNoteAt(index);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Збереження нотаток'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введіть нотатку',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNote,
              child: Text('Додати нотатку'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (direction) => _deleteNoteAt(index),
                    child: ListTile(
                      title: Text(note.text),
                      subtitle: Text(note.date),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

