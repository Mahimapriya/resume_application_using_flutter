import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/details_list/projectlist.dart';

class Project {
  String projectName = '';
  String description = '';
  String startDate = '';
  String endDate = '';
}

class ProjectForm extends StatefulWidget {
  @override
  _ProjectFormState createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Project> _projects = [Project()];

  void _addProject() {
    setState(() {
      _projects.add(Project());
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _projects.removeAt(index);
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final firestore = FirebaseFirestore.instance;
      CollectionReference projectsCollection = firestore.collection('projects');

      for (var project in _projects) {
        await projectsCollection.add({
          'projectName': project.projectName,
          'description': project.description,
          'startDate': project.startDate,
          'endDate': project.endDate,
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Projects Form'),
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
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    return _buildProjectField(index);
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProject,
                child: Text('Add Project'),
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

  Widget _buildProjectField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project ${index + 1}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Project Name', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the project name';
            }
            return null;
          },
          onSaved: (value) => _projects[index].projectName = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Description', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the description';
            }
            return null;
          },
          onSaved: (value) => _projects[index].description = value!,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Start Date', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the start date';
                  }
                  return null;
                },
                onSaved: (value) => _projects[index].startDate = value!,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'End Date', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the end date';
                  }
                  return null;
                },
                onSaved: (value) => _projects[index].endDate = value!,
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _removeExperience(index);
              },
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
