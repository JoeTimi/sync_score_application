// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? message;
  String? id;
  String? name;
  String? email;
  String? token;

  Welcome({
    this.message,
    this.id,
    this.name,
    this.email,
    this.token,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    message: json["message"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "_id": id,
    "name": name,
    "email": email,
    "token": token,
  };
}
