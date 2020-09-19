import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool _obscureText = true;

var url =
    "https://www.dicoding.com/images/original/event/dsc_chapter_stmik_stikom_indonesia_introducing_developer_student_club_and_google_technologies_logo_041019113915.png";

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String password;
  String email;
  var url =
      "https://www.dicoding.com/images/original/event/dsc_chapter_stmik_stikom_indonesia_introducing_developer_student_club_and_google_technologies_logo_041019113915.png";
  //var fsconnect = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var msgtextcontrollerpass = TextEditingController();
    var msgtextcontrolleruser = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: new Container(
          padding: new EdgeInsets.all(8.0),
          width: 15.0,
          height: 15.0,
          child: CircleAvatar(child: Image(image: NetworkImage(url))),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                //controller: msgtextcontrolleruser,
                decoration: InputDecoration(hintText: "Enter email"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 30),
              TextField(
                //controller: msgtextcontrollerpass,
                obscureText: _obscureText,
                decoration: InputDecoration(hintText: "Enter password"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 20),
              Material(
                color: Colors.blueAccent,
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: MaterialButton(
                  onPressed: () async {
                    if (email != "admin@dsc.com" && password != "admindsc") {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Wrong email or password"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    await authc.signInWithEmailAndPassword(
                        email: email, password: password);
                    var user = await authc.currentUser;
                    print(user);
                    try {
                      if (user != null) {
                        Navigator.pushNamed(context, "img");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
