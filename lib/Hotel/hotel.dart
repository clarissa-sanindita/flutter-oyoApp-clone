// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../detail_hotel.dart';
import 'modelHotel.dart';

class Hotel2App extends StatefulWidget {
  final int index;
  Hotel2App({required this.index});

  @override
  State<Hotel2App> createState() => _Hotel2AppState();
}

class _Hotel2AppState extends State<Hotel2App> {
  @override
  Widget build(BuildContext context) {
    List<HotelModel> menu = context.watch<HotelService>().menu;
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      menu[widget.index].name,
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
                    alignment: Alignment.topLeft,
                    child: Text(
                      menu[widget.index].deskripsi,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        HotelUpdate();
      }

        
    );
  }

  void HotelUpdate() {
    final namaNew = TextEditingController(
        text: context.read<HotelService>().menu[widget.index].name);
    final deskripsiNew = TextEditingController(
        text: context.read<HotelService>().menu[widget.index].deskripsi);
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
                            controller: namaNew,
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
                            controller: deskripsiNew,
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
                      context.read<HotelService>().deleteHotel(widget.index);
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete')),
                TextButton(
                    onPressed: () {
                      if (namaNew.text.isNotEmpty &&
                          deskripsiNew.text.isNotEmpty) {
                        context.read<HotelService>().updateHotel(
                            widget.index,
                            HotelModel(
                                deskripsi: deskripsiNew.text,
                                name: namaNew.text));
                        ;
                        Navigator.of(context).pop();
                      } else if (namaNew.text.isEmpty ||
                          deskripsiNew.text.isEmpty) {
                        showAlertDialog(context);
                      }
                      ;
                    },
                    child: Text('Edit')),
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
