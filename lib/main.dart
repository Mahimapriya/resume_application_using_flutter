import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newapp/firebase_options.dart';
import 'package:newapp/screens/rows.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(newclas());
}

class newclas extends StatelessWidget {
  const newclas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Resume App",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class newstatefullclass extends StatefulWidget {
  const newstatefullclass({super.key});

  @override
  State<newstatefullclass> createState() => _newstatefullclassState();
}

class _newstatefullclassState extends State<newstatefullclass> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("next"),
            trailing: IconButton(
              icon: liked
                  ? (Icon(Icons.favorite))
                  : (Icon(Icons.favorite_border)),
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
