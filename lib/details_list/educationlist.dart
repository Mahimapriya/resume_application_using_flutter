import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EducationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education List'),
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
      body: EducationList(),
    );
  }
}

class EducationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('education').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No education data found.');
        }

        // If there's data, build the list
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var doc = snapshot.data!.docs[index];
            var collegeName = doc.get('collegeName') ?? 'N/A';
            var degree = doc.get('degree') ?? 'N/A';
            var passingYear = doc.get('passingYear') ?? 'N/A';
            var cgpaOrPercentage = doc.get('cgpaOrPercentage') ?? 'N/A';

            return ListTile(
              title: Text(collegeName),
              subtitle: Text('$degree | $passingYear | $cgpaOrPercentage'),
            );
          },
        );
      },
    );
  }
}
