import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Messages extends StatelessWidget {
  const Messages({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("chat").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final chatDocs = chatSnapshot.data.documents;

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder: (context, index) => Text(chatDocs[index]["text"])
        );
      },
    );
  }
}