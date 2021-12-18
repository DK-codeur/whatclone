// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessageInput extends StatefulWidget {
  NewMessageInput({key}) : super(key: key);

  @override
  _NewMessageInputState createState() => _NewMessageInputState();
}

class _NewMessageInputState extends State<NewMessageInput> {

  var _enteredMessage = '';
  final _controller = new TextEditingController();


  void _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();

    Firestore.instance
    .collection("chat")
    .add({
      "text" : _enteredMessage,
      "createdAt": Timestamp.now(),
      "userId": user.uid
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Type  message...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 0.8, 
                    color: Colors.grey.withOpacity(0.3)
                  )
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 0.8, 
                    color: Colors.grey.withOpacity(0.3)
                  )
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 1, 
                    color: Colors.grey.withOpacity(0.6)
                  )
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),

          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send, color: Colors.teal),
          )
        ],
      )
    );
  }
}