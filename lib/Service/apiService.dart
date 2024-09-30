import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  );

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('/products');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch the Products from API');
    }
  }
}
