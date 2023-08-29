import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/details_list/aoilist.dart';

class Note {
  String title = '';
  String content = '';
}

class NoteForm extends StatefulWidget {
  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Note> _notes = [Note()];

  void _addNote() {
    setState(() {
      _notes.add(Note());
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final firestore = FirebaseFirestore.instance;
      CollectionReference aoiCollection = firestore.collection('aoi');

      for (var note in _notes) {
        await aoiCollection.add({'title': note.title, 'content': note.content});
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.2))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return _buildNoteField(index);
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNote,
                child: Text('Add Note'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Note ${index + 1}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration:
              InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the title';
            }
            return null;
          },
          onSaved: (value) => _notes[index].title = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Content', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the content';
            }
            return null;
          },
          onSaved: (value) => _notes[index].content = value!,
          maxLines: 3,
        ),
        SizedBox(height: 10),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            _removeExperience(index);
          },
        ),
      ],
    );
  }
}
