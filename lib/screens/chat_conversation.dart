// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatclone/widgets/chat/messages.dart';
import 'package:whatclone/widgets/chat/new_messages_input.dart';

class ChatConversation extends StatelessWidget {
  const ChatConversation({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        leadingWidth: 30,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          // horizontalTitleGap: 0,
          leading: CircleAvatar( 
            backgroundImage: NetworkImage(
              "https://pbs.twimg.com/media/Eq6bKrUXYAMr1yG?format=jpg&name=large"
            ),
          ),
          title: Text(
            "Dorgeles Koble",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),

          subtitle: Text(
            "Online",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.videocam_sharp)
          ),

          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.call)
          )
        ]
      ),
      body: Column(
        children: [
          Expanded(
            child: Messages(),
          ),

          NewMessageInput()
        ],
      )
    );
  }
}