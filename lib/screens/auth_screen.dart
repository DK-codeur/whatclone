import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatclone/widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String email, String password, String username, bool isLogin,) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin)  {
        authResult = await _auth.signInWithEmailAndPassword( email: email, password: password );

      } else {
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        await Firestore.instance.collection("users")
        .document(authResult.user.uid)
        .setData({
          "username": username,
          "email": email,
        });
      }
      
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }
      
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(content: Text(message), backgroundColor: Colors.red,)
      );

      setState(() {
        _isLoading = false;
      });

    } catch (e) {
      print("######## $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}