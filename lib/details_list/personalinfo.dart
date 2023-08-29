import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
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
      body: UserDetailsList(),
    );
  }
}

class UserDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No user details found.');
        }

        // If there's data, build the list
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var doc = snapshot.data!.docs[index];
            var FullName = doc.get('FullName') ?? 'N/A';
            var Email = doc.get('Email') ?? 'N/A';
            var Phone = doc.get('Phone') ?? 'N/A';
            var address = doc.get('Password') ?? 'N/A';
            var dob = doc.get('DOB') ?? 'N/A';
            var proff = doc.get('Profession') ?? 'N/A';

            var obj = doc.get('Objective') ?? 'N/A';

            // ... repeat for other fields

            return ListTile(
              title: Text(FullName),
              subtitle: Text(
                  ' Email:$Email \n| Phone: $Phone \n| DOB:$dob \n| Profession:$proff \n|Adress:$address \n|Objective:$obj'),
            );
          },
        );
      },
    );
  }
}
