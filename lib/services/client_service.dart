import 'dart:convert';

import 'package:lgs_mobile_client/models/auth.dart';

bool tokenIsValid(Token token) {
  if (token.token == null) return false;

  final accessToken = token.token;
  String normalizedString = base64.normalize(accessToken.split('.')[1]);
  var decodedJson = json.decode(ascii.decode(base64.decode(normalizedString)));

  return DateTime.fromMillisecondsSinceEpoch(decodedJson["exp"] * 1000)
      .isAfter(DateTime.now());
}
