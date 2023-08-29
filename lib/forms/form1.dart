import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/details_list/educationlist.dart';

class EducationDegree {
  String collegeName = '';
  String degree = '';
  String passingYear = '';
  String cgpaOrPercentage = '';
}

class EducationForm extends StatefulWidget {
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<EducationDegree> _educationDegrees = [EducationDegree()];

  void _addDegree() {
    setState(() {
      _educationDegrees.add(EducationDegree());
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _educationDegrees.removeAt(index);
    });
  }

// ... (other code)

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save education data to Firestore
      final firestore = FirebaseFirestore.instance;
      CollectionReference educationCollection =
          firestore.collection('education');

      for (var degree in _educationDegrees) {
        await educationCollection.add({
          'collegeName': degree.collegeName,
          'degree': degree.degree,
          'passingYear': degree.passingYear,
          'cgpaOrPercentage': degree.cgpaOrPercentage,
        });
      }

      print('Education data saved to Firestore');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EducationListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Details'),
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
                  itemCount: _educationDegrees.length,
                  itemBuilder: (context, index) {
                    return _buildEducationDegreeField(index);
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addDegree,
                child: Text('Add Education'),
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

  Widget _buildEducationDegreeField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education ${index + 1}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'College Name', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter college name';
            }
            return null;
          },
          onSaved: (value) => _educationDegrees[index].collegeName = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Degree', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter degree';
            }
            return null;
          },
          onSaved: (value) => _educationDegrees[index].degree = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Passing Year', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter passing year';
            }
            return null;
          },
          onSaved: (value) => _educationDegrees[index].passingYear = value!,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'CGPA/Percentage', border: OutlineInputBorder()),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter CGPA/Percentage';
            }
            return null;
          },
          onSaved: (value) =>
              _educationDegrees[index].cgpaOrPercentage = value!,
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
