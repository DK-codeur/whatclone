// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatclone/widgets/chat/messages.dart';

class ChatConversation extends StatelessWidget {
  const ChatConversation({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {
              Firestore.instance
              .collection("chats/2xHaiHmPy7ZhOcLFJ8rS/messages")
              .add({
                "text" : "add data"
              });
            }, 
            icon: Icon(Icons.add)
          )
        ]
      ),
      body: Container(
        child: Messages(),
      )
    );
  }
}