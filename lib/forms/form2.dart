import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/details_list/workexplist.dart';

class WorkExperience {
  String jobTitle = '';
  String company = '';
  String startDate = '';
  String endDate = '';
}

class WorkExperienceForm extends StatefulWidget {
  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<WorkExperience> _workExperiences = [WorkExperience()];

  void _addExperience() {
    setState(() {
      _workExperiences.add(WorkExperience());
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _workExperiences.removeAt(index);
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final firestore = FirebaseFirestore.instance;
      CollectionReference workexpCollection = firestore.collection('workexp');

      for (var experience in _workExperiences) {
        await workexpCollection.add({
          'Job Title': experience.jobTitle,
          'company': experience.company,
          'startDate': experience.startDate,
          'endDate': experience.endDate,
        });
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkExperienceListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experiences Details'),
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
                  itemCount: _workExperiences.length,
                  itemBuilder: (context, index) {
                    return _buildWorkExperienceField(index);
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addExperience,
                child: Text('Add Experience'),
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

  Widget _buildWorkExperienceField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Work Experience ${index + 1}',style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10.0,),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Job Title', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the job title';
            }
            return null;
          },
          onSaved: (value) => _workExperiences[index].jobTitle = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Company', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the company';
            }
            return null;
          },
          onSaved: (value) => _workExperiences[index].company = value!,
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
                onSaved: (value) => _workExperiences[index].startDate = value!,
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
                onSaved: (value) => _workExperiences[index].endDate = value!,
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
