import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'checkout.dart';
import 'dash.dart';
import 'main.dart';

class doneApp extends StatefulWidget {

  String value;
  doneApp(this.value);


  @override
  State<doneApp> createState() => _doneAppState(value);
}

class _doneAppState extends State<doneApp> {

  String value;
  _doneAppState(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.library_add_check_rounded,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Text(
                "Selamat",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Pemesanan Berhasil",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                  ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Okay',
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