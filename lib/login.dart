
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';
import 'dash.dart';
import 'dio/network/api/auth/auth.dart';
import 'dio/network/dio_client.dart';
import 'dio/repo/auth.dart';
import 'dummy_data.dart';
import 'main.dart';
import 'model_auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final List<Map<String, dynamic>> dummydata = DummyData.data;
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

void execLogin(String username, String password) async {
    Dio dio = Dio();
    DioClient dioClient = DioClient(dio);
    AuthApi authApi = AuthApi(dioClient: dioClient);
    AuthRepository repo = AuthRepository(authApi: authApi);
    try {
      AlertDialog alert = AlertDialog(
        content: Row(children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.blue,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ]),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      ModelAuth logins = await repo.loginReq(username, password);
      String getName = await repo.meReq(logins.access_token);
      final prefs = await SharedPreferences.getInstance();
      Navigator.pop(context);
      prefs.setString("token", logins.access_token);
      prefs.setString("name", getName);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
          (Route<dynamic> route) => false);
    } catch (e) {
      // Navigator.pop(context);
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: const Text("Login Failed"),
      //         content: const Text("username atau password tidak ditemukan!!"),
      //         actions: <Widget>[
      //           FlatButton(
      //             child: const Text("OK"),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           )
      //         ],
      //       );
      //     });
    // 
     Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
          (Route<dynamic> route) => false);
  }
}

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
                  SizedBox(
                    height: 100,
                  ),
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
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
 

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                        
                      color: Colors.blue,
                      onPressed: () async {
                        AuthService loginGoogle = AuthService(FirebaseAuth.instance);
                        try {
                          await loginGoogle.googleAuth();
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
                          );
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                    
                      child: Text(
                        'Login With Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan username",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Username",
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
                    controller: usernamecontroller,
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
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red)),
                      onPressed: ()  {
                        // AuthService auth = AuthService(FirebaseAuth.instance);
                        // try {
                        //   bool login = await auth.signIn(username: emailcontroller.text, password: passwordcontroller.text);
                        //   if (login) {
                        //     Navigator.pushNamed(context, '/');
                        //   } else {
                        //     showMessage("Gagal Login!!");
                        //   }
                        // } catch (e) {
                        //   if (e is FirebaseAuthException) {
                        //     showMessage(e.message!);
                        //   }
                        // }
                        // ;
                     
                              execLogin(usernamecontroller.text, passwordcontroller.text);
                           
                            
                      },
                      child: Text(
                        'Login',
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
                      onTap: () {
                        Navigator.pushNamed(context, '/signin'
                      );
                      },
                      child: Text("Tidak punya akun? Buat akun")),
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
