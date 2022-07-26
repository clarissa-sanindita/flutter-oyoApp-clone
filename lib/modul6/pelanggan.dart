// To parse this JSON data, do
//
//     final pelanggan = pelangganFromJson(jsonString);

import 'dart:convert';

Pelanggan pelangganFromJson(String str) => Pelanggan.fromJson(json.decode(str));

String pelangganToJson(Pelanggan data) => json.encode(data.toJson());

class Pelanggan {
    Pelanggan({
        required this.id,
        required this.userId,
        required this.nama,
        required this.alamat,
        required this.email,
        required this.telp,
    });

    int id;
    int userId;
    String nama;
    String alamat;
    String email;
    String telp;

    factory Pelanggan.fromJson(Map<String, dynamic> json) => Pelanggan(
        id: json["id"],
        userId: json["user_id"],
        nama: json["nama"],
        alamat: json["alamat"],
        email: json["email"],
        telp: json["telp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama": nama,
        "alamat": alamat,
        "email": email,
        "telp": telp,
    };
}
