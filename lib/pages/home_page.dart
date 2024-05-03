// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Container(
              // margin: EdgeInsets.only(top: 30),
              child: Row(
            children: <Widget>[
              Text(
                'NoteHub',
                style: TextStyle(fontSize: 36),
              ),
              Icon(Icons.arrow_downward)
            ],
          )),
        ),
        body: Container(
          child: Column(
            children: <Widget>[SearchBar(), Expanded(child: NoteList())],
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
            borderRadius: BorderRadius.circular(20),
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
            color: Colors.grey[50],
            elevation: 2.0,
            child: ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
              trailing: Text(formatDateTime(notes[index].dateTime)),
              onTap: () {},
              contentPadding: EdgeInsets.all(8.0),
            ));
      },
    );
  }
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd - kk:mm').format(dateTime);
}

List<Note> generateNotes() {
  return List.generate(10, (index) {
    return Note(
        title: 'Note $index',
        content: 'This is the content of note $index',
        dateTime: DateTime.now().subtract(Duration(days: index * 2)));
  });
}

class Note {
  final String title;
  final String content;
  final DateTime dateTime;

  Note({required this.title, required this.content, required this.dateTime});
}
