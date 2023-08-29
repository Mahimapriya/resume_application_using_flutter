import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkExperienceListScreen extends StatelessWidget {
  Stream<QuerySnapshot> fetchWorkExperiences() {
    CollectionReference workexpCollection =
        FirebaseFirestore.instance.collection('workexp');
    return workexpCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experiences'),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchWorkExperiences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No work experiences found.');
          }

          // If there's data, build the list
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var jobTitle = doc.get('Job Title') ?? 'N/A';
              var company = doc.get('company') ?? 'N/A';
              var startDate = doc.get('startDate') ?? 'N/A';
              var endDate = doc.get('endDate') ?? 'N/A';

              return ListTile(
                title: Text(jobTitle),
                subtitle: Text('$company | $startDate - $endDate'),
              );
            },
          );
        },
      ),
    );
  }
}
