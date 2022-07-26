
import 'package:dio/dio.dart';
import '../../modul6/pelanggan.dart';
import '../network/dio_exception.dart';

class AdRepository {
  final adApi;
  AdRepository({required this.adApi});
  Future<List<Pelanggan>> getAllAdReq(String token) async {
    try {
      final response = await adApi.getAllAd(token);
      final ad = (response.data['data'] as List)
          .map((e) => Pelanggan.fromJson(e))
          .toList();
      return ad;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
