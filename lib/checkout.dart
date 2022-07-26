import 'package:flutter/material.dart';

import 'done.dart';

class checkoutApp extends StatefulWidget {
  const checkoutApp({Key? key}) : super(key: key);

  @override
  State<checkoutApp> createState() => _checkoutAppState();
}

class _checkoutAppState extends State<checkoutApp> {

  String value="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Masukkan Data Diri Anda",
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
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),

                hintText: "Masukkan Nama",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Nama",
                labelStyle: TextStyle(color: Colors.black87),
              ),
              onChanged: (text){
                value = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),

                hintText: "Masukkan Nomor HP",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Nomor Hp",
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),

                hintText: "Masukkan Alamat",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Alamat",
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => doneApp(value)),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green,
                ),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Simpan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

