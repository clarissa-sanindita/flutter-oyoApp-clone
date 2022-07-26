import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyo/detail_hotel.dart';
import 'package:provider/provider.dart';

import 'hotel.dart';
import 'modelHotel.dart';

class HotelApp extends StatefulWidget {
  HotelApp({Key? key}) : super(key: key);

  @override
  State<HotelApp> createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  @override
  Widget build(BuildContext context) {
    List<HotelModel> menu = context.watch<HotelService>().menu;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Penawaran",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return Hotel2App(index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HotelAdd();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  void HotelAdd() {
    final namaController = TextEditingController();
    final deskripsiController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: 180,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 168, 0),
                            child: Text(
                              'Nama Hotel',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                          TextField(
                            controller: namaController,
                            decoration: InputDecoration(
                              hintText: 'Hotel Pelangi',
                              hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 151, 150, 150)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 140, 0),
                            child: Text(
                              'Deskripsi Hotel',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                          TextField(
                            controller: deskripsiController,
                            decoration: InputDecoration(
                              hintText: 'Hotel ini..',
                              hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 151, 150, 150)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      namaController.clear();
                      deskripsiController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      if (namaController.text.isNotEmpty &&
                          deskripsiController.text.isNotEmpty) {
                        context.read<HotelService>().addHotel(HotelModel(
                            deskripsi: deskripsiController.text,
                            name: namaController.text));
                        Navigator.of(context).pop();
                      } else if (namaController.text.isEmpty ||
                          deskripsiController.text.isEmpty) {
                        showAlertDialog(context);
                      }
                      ;
                    },
                    child: Text('Tambah')),
              ],
            ));
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Peringatan",
        style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
            fontWeight: FontWeight.w700,
            fontSize: 18),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      content: Text(
        "Tolong isi dengan benar",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
