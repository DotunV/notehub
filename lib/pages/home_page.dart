import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Note> notes = generateNotes();

    return Scaffold(
      appBar: AppBar(
        title: Text('NotePad'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
            onTap: () {},
          );
        },
      ),
      bottomNavigationBar: null,
    );
  }
}

List<Note> generateNotes() {
  return List.generate(10, (index) {
    return Note(
      title: 'Note $index',
      content: 'This is the content of note $index',
    );
  });
}

class Note {
  final String title;
  final String content;

  Note({required this.title, required this.content});
}
