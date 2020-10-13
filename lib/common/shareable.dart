import 'package:flutter/material.dart';

class ErrorMessage {
  Map<dynamic, dynamic> _data;

  String get context => _data['@context'];
  String get type => _data['@type'];
  String get title => _data['hydra:title'];
  String get description => _data['hydra:description'] ?? _data['message'];

  ErrorMessage(this._data);
}

enum MessageType { error, successful, info, warning, busy }

const MessageTypeIcons = {
  MessageType.error: Icon(
    Icons.error,
    color: Colors.red,
  ),
  MessageType.successful: Icon(
    Icons.check_circle,
    color: Colors.green,
  ),
  MessageType.info: Icon(
    Icons.info,
    color: Colors.white,
  ),
  MessageType.warning: Icon(
    Icons.warning,
    color: Colors.yellow,
  ),
};

showSnackBar(GlobalKey<ScaffoldState> scaffoldState,
    {MessageType type: MessageType.info,
    @required String message,
    Duration duration: const Duration(seconds: 4)}) {
  scaffoldState.currentState.showSnackBar(SnackBar(
    content: Row(
      children: [
        MessageTypeIcons[type],
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        )
      ],
    ),
  ));
}
