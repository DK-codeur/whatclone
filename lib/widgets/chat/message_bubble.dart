// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;

  MessageBubble(this.message, this.isMe, {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isMe ? Color(0xFFe2ffc9) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: !isMe ? Radius.circular(0) : Radius.circular(5),
              topRight: isMe ? Radius.circular(0) : Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
            )
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.5
            ),
          ),
        ),
      ],
    );
  }
}