// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:oyo/login.dart';
import 'package:oyo/squareHome.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OYO',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
          ),
          actions: [
            Icon(
              Icons.notifications_none,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          centerTitle: true,
          title: Text("OYO"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              SearchHome(),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "OYO Membership",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: Ink.image(
                        image: AssetImage('assets/satu.jpg'),
                        child: InkWell(
                          onTap: () {},
                        ),
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    squareHome(),
                    squareHome(),
                    squareHome(),
                    squareHome(),
                    squareHome(),
                    squareHome(),
                    squareHome(),
                    squareHome(),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: Ink.image(
                        image: AssetImage('assets/tiga.jpg'),
                        child: InkWell(
                          onTap: () {},
                        ),
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Playday Sale ID',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: Ink.image(
                        image: AssetImage('assets/dua.jpg'),
                        child: InkWell(
                          onTap: () {},
                        ),
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Search for Hotel, City, or Location",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
