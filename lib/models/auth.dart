// Application Token Model
import 'package:flutter/material.dart';

class Token {
  final String token;
  final String refreshToken;

  Token({@required this.token, @required this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> data) {
    return Token(token: data['token'], refreshToken: data['refresh_token']);
  }
}

class User {
  int id;
  String email;
  String firstName;
  String lastName;

  User({int id, email, String firstName, String lastName});
}

class RegistrationModel {
  String firstName;
  String lastName;
  String email;
  String password;

  RegistrationModel({this.firstName, this.lastName, this.email, this.password});

  getJson() {
    return {
      "firstName": this.firstName,
      "lastName": this.lastName,
      "email": this.email,
      "password": this.password
    };
  }
}

class LoginModel {
  String email;
  String password;

  Map<String, dynamic> get json => {"email": email, "password": password};

  LoginModel({this.email, this.password});
}
