import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';
import 'dash.dart';
import 'dummy_data.dart';
import 'main.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  final List<Map<String, dynamic>> dummydata = DummyData.data; 
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    int? currentid = prefs.getInt('id');
    for (var i = 0; i < dummydata.length; i++) {
      if (currentid != null && currentid == dummydata[i]['id']) {
        prefs.setString('nama', dummydata[i]['nama']);
        prefs.setString('nim', dummydata[i]['Nim']);
        Navigator.pushReplacementNamed(
          context,
          '/',
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "REGISTRASI",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan email",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black87),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.black87),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.black87),
                        gapPadding: 10,
                      ),
                    ),
                    controller: emailcontroller,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black87),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        child: Icon(
                          Icons.lock,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.black87),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.black87),
                        gapPadding: 10,
                      ),
                    ),
                    controller: passwordcontroller,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red,
                      onPressed: () async {
                       AuthService auth = AuthService(FirebaseAuth.instance);
                    try {
                      bool register = await auth.signUp(
                          email: emailcontroller.text,
                          password: passwordcontroller.text);
                      if (register) {
                        auth.signIn(email: emailcontroller.text, password: passwordcontroller.text);
                        Navigator.pushNamed(context, '/');
                      } else {
                        showMessage("Gagal Register!!");
                      }
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        showMessage(e.message!);
                      }
                    }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, '/login');

                    },
                    child: Text("Sudah punya akun? Login")
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}
