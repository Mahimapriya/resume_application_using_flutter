import 'package:flutter/material.dart';
import 'package:newapp/forms/form.dart';
import 'package:newapp/forms/form1.dart';
import 'package:newapp/forms/form2.dart';
import 'package:newapp/forms/form3.dart';
import 'package:newapp/forms/form4.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String> information = [
  "Personal Information",
  "Education",
  "Work Experience",
  "Projects",
  "Area of Interest"
];
bool? _checkBox1 = false;
bool? _checkBox2 = false;
bool? _checkBox3 = false;
bool? _checkBox4 = false;
bool? _checkBox5 = false;

class _HomeState extends State<Home> {
  String? pdfPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        elevation: 15,
        titleSpacing: 40.0,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.2))),
      ),
      drawer: Drawer(
        elevation: 100,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.purpleAccent,
                  child: Column(children: [
                    Text(
                      "Hello User",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]),
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.upload),
              title: Text("Upload"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
              ),
              title: Text(
                "Personal Information",
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Myform()));
              },
              trailing: Checkbox(
                value: _checkBox1,
                onChanged: ((value) {
                  setState(() {
                    _checkBox1 = value;
                  });
                }),
              )),
          ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
              ),
              title: Text(
                "Education",
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EducationForm()));
              },
              trailing: Checkbox(
                value: _checkBox2,
                onChanged: ((value) {
                  setState(() {
                    _checkBox2 = value;
                  });
                }),
              )),
          ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
              ),
              title: Text(
                "Work Experience",
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkExperienceForm()));
              },
              trailing: Checkbox(
                value: _checkBox3,
                onChanged: ((value) {
                  setState(() {
                    _checkBox3 = value;
                  });
                }),
              )),
          ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
              ),
              title: Text(
                "Projects",
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProjectForm()));
              },
              trailing: Checkbox(
                value: _checkBox4,
                onChanged: ((value) {
                  setState(() {
                    _checkBox4 = value;
                  });
                }),
              )),
          ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
              ),
              title: Text(
                "Area of Interest",
              ),
              subtitle: Text("Details"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoteForm()));
              },
              trailing: Checkbox(
                value: _checkBox5,
                onChanged: ((value) {
                  setState(() {
                    _checkBox5 = value;
                  });
                }),
              )),
        ],
      )),
    );
  }
}
