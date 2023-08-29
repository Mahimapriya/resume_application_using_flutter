import 'package:flutter/material.dart';

// ignore: must_be_immutable
class details extends StatelessWidget {
  details(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.dob,
      required this.proff,
      required this.objective});

  String name, email, phone, address, dob, proff, objective;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(name),
              Text(email),
              Text(phone),
              Text(address),
              Text(dob),
              Text(proff),
              Text(objective)
            ],
          ),
        ));
  }
}
