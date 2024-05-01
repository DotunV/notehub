// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NoteHub'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SearchBar(),
              ),
              Expanded(child: NoteList())
            ],
          ),
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search notes',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onChanged: (value) {
          // Add search logic here
        },
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Note> notes = generateNotes();

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
              onTap: () {},
            ));
      },
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
