import 'dart:convert';

class LoginData {
  DateTime? dob;
  String? email;
  String? name;
  String? phone;
  String? uid;

  LoginData({
    this.dob,
    this.email,
    this.name,
    this.phone,
    this.uid,
  });

  factory LoginData.fromJson(String str) => LoginData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "email": email,
        "name": name,
        "phone": phone,
        "uid": uid,
      };
}
