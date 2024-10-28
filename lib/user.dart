// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? id;
  String? name;
  String? email;
  String? address;
  String? dob;

  Welcome({
    this.id,
    this.name,
    this.email,
    this.address,
    this.dob,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    dob: json["dob"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "address": address,
    "dob": dob,
  };
}
