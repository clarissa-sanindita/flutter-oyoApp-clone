import 'package:dio/dio.dart';

import '../../constant/endpoint.dart';
import '../../dio_client.dart';

class AdApi {
  final DioClient dioClient;

  AdApi({required this.dioClient});

  Future<Response> getAllAd(String token) async {
    try {
      final Response response = await dioClient.get(Endpoints.ad,
          options: Options(headers: {"Authorization": "bearer " + token}));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createAd(String nama, String alamat, String luas,
      String harga, String deskripsi, String token) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.ad,
        data: {
          "name": nama,
          "alamat": alamat,
          "luas": luas,
          "harga": harga,
          "deskripsi": deskripsi,
        },
        options: Options(
          headers: {"Authorization": "bearer " + token},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateAd(int id, String nama, String alamat, String luas,
      String harga, String deskripsi, String token) async {
    try {
      final Response response = await dioClient.put(
        Endpoints.ad + "/$id",
        data: {
          "name": nama,
          "alamat": alamat,
          "luas": luas,
          "harga": harga,
          "deskripsi": deskripsi,
        },
        options: Options(
          headers: {"Authorization": "bearer " + token},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteAd(int id, String token) async {
    try {
      final Response response = await dioClient.delete(
        Endpoints.ad + "/$id",
        options: Options(
          headers: {"Authorization": "bearer " + token},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
