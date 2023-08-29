import 'package:flutter/material.dart';
import 'package:newapp/authentication/models/user_model.dart';
import 'package:newapp/widgets/textform.dart';

class ControllerInfo {
  final String name;
  final TextEditingController controller;

  ControllerInfo({required this.name, required this.controller});
}

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  var _name, _email, _phone, _address, _dob, _proff, _objective;
  List<ControllerInfo> _controllers = [];

  final _namecontroller = TextEditingController(),
      _emailcontroller = TextEditingController(),
      _phonecontroller = TextEditingController(),
      _addresscontroller = TextEditingController(),
      _dobcontroller = TextEditingController(),
      _proffcontroller = TextEditingController(),
      _objcontroller = TextEditingController(),
      _searchcontroller = TextEditingController();

  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers = [
      ControllerInfo(name: "Full Name", controller: _namecontroller),
      ControllerInfo(name: "Email", controller: _emailcontroller),
    ];
  }

  void _updateText() {
    setState(() {
      _name = _namecontroller.text;
      _email = _emailcontroller.text;
      _phone = _phonecontroller.text;
      _address = _addresscontroller.text;
      _dob = _dobcontroller.text;
      _proff = _proffcontroller.text;
      _objective = _objcontroller.text;
    });
  }

  String? _performSearch() {
    final searchText = _searchcontroller.text;

    for (var controllerInfo in _controllers) {
      if (controllerInfo.controller.text.contains(searchText)) {
        break;
      }
    }

    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          titleSpacing: 40.0,
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.2))),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Textfield(
                    namecontroller: _namecontroller, hintText: "Full Name"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(namecontroller: _emailcontroller, hintText: "Email"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(
                    namecontroller: _phonecontroller, hintText: "Phone Number"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(
                    namecontroller: _addresscontroller, hintText: "Address"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(namecontroller: _dobcontroller, hintText: "DOB"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(
                    namecontroller: _proffcontroller, hintText: "Profession"),
                SizedBox(
                  height: 10.0,
                ),
                Textfield(
                    namecontroller: _objcontroller, hintText: "Objective"),
                SizedBox(height: 20.0),
                myBtn(context),
              ],
            ),
          ),
        ));
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: Size(200, 50)),
      onPressed: () {
        final user = UserModel(
          fullname: _namecontroller.text.trim(),
          email: _emailcontroller.text.trim(),
          phoneNo: _phonecontroller.text.trim(),
          address: _addresscontroller.text.trim(),
          dob: _dobcontroller.text.trim(),
          proff: _proffcontroller.text.trim(),
          obj: _objcontroller.text.trim(),
        );

        // Convert the UserModel to a JSON-like Map
      },
      child: Text("Save"),
    );
  }
}
