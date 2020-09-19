// Application Token Model
import 'package:flutter/material.dart';

class Token {
  final String token;
  final String refreshToken;

  Token({@required this.token, @required this.refreshToken});
}

class User {
  User(int id, email, String firstName, String lastName);
}
