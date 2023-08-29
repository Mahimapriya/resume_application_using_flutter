class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phoneNo;
  final String address;
  final String dob;
  final String proff;
  final String obj;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.dob,
    required this.proff,
    required this.obj,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Phone": phoneNo,
      "Password": address,
      "DOB": dob,
      "Profession": proff,
      "Objective": obj,
    };
  }
}
