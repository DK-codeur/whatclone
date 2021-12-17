import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatclone/screens/call_screen.dart';
import 'package:whatclone/screens/chats_list_screen.dart';
import 'package:whatclone/screens/status_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: SizedBox( 
          width: 50,
          height: 50,
          child: FloatingActionButton(
            child: const Icon(Icons.chat),
            onPressed: () {
              Firestore.instance
              .collection( "chats/2xHaiHmPy7ZhOcLFJ8rS/messages")
              .snapshots()
              .listen((data) {
                data.documents.forEach((documents) {
                  print("##### ${documents["text"]}"); 
                });
              }); 
            },
          ),
        ),
        appBar: AppBar(
          actions: [
            // Widget for the search
            const Icon(Icons.search),
            // Widget for implementing the three-dot menu
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text('logout'),
                    onTap: () {},
                    value: "logout",
                  ),
                ];
              },

              onSelected: (value) {
                switch (value) {
                  case "logout":
                    FirebaseAuth.instance.signOut();
                    break;
                  default:
                }
              },
            ),
          ],
          backgroundColor: const Color(0xff128C7E),
          title: const Text('WhatsApp'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  iconMargin: EdgeInsets.all(100),
                  child: Icon(
                    Icons.camera_alt_rounded,
                  )),
              Tab(
                child: Text('CHATS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('STATUS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('CALLS', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('This feature is coming soon')),
            ChatListCreen(),
            StatusTab(),
            CallTab(),
          ],
        ),
      ),
    );
  }
}