import 'package:school_app/features/register/data/datasources/register_remote_data_source.dart';

import '../models/register_response.dart';

class RegisterRepository {
  final RegisterRemoteDataSource remote;

  RegisterRepository(this.remote);

  Future<RegisterResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    // إرسال البيانات إلى الـ RemoteDataSource
    final data = await remote.register({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "password": password,
    });

    // تحويل JSON إلى Model
    return RegisterResponse.fromJson(data);
  }
}
