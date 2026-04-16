import 'package:dio/dio.dart';
import 'package:school_app/core/constants/api_constants.dart';

class RegisterRemoteDataSource {
  final Dio dio;

  RegisterRemoteDataSource(this.dio);

  Future<Map<String, dynamic>> register(Map<String, dynamic> body) async {
    final response = await dio.post(EndPoints.register, data: body);
    print("${response.statusCode}");
    print("${response.statusMessage}");
    return response.data;
  }
}
