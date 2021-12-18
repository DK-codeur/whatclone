// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatclone/screens/auth_screen.dart';
import 'package:whatclone/screens/home_screen.dart';

import 'screens/call_screen.dart';
import 'screens/chats_list_screen.dart';
import 'screens/status_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatClone',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomeScreen();
          }

          return AuthScreen();
        },
      )
    );
  }
}

