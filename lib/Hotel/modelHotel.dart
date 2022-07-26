import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HotelService extends ChangeNotifier{
List<HotelModel> menu =[
  HotelModel(
    name: "Hotel Pelangi",
    deskripsi: "Jalan Mawar, No 21"
  ),
  HotelModel(
    name: "Hotel Mulia",
    deskripsi: "Jalan Mulia Jaya"
  ),
];

  void addHotel(HotelModel tambahHotel){
    menu.add(tambahHotel);
    notifyListeners();
  }

  void updateHotel(int index, HotelModel editHotel){
    List<HotelModel> temp=[];
    for (var i = 0; i < menu.length; i++){
      if(i == index){
        temp.add(editHotel);
        continue;
      }
      temp.add(menu[i]);
    }
    menu = temp;
    notifyListeners();
  }

  void deleteHotel(int index){
    menu.removeAt(index);
    notifyListeners();
  }

}

class HotelModel{
  final String name;
  final String deskripsi;

  HotelModel({
    required this.name,
    required this.deskripsi,
  });
}



