import 'package:school_app/features/register/data/datasources/register_remote_data_source.dart';
import 'package:school_app/features/register/data/models/register_response.dart';

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
    final Map<String, dynamic> result = await remote.register({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "password": password,
    });

    final status = result["statusCode"];
    final message = result["message"];
    final data = result["data"];

    if (status == 200) {
      return RegisterResponse(
        success: true,
        message: "Right Sent info✅",
        // message: "${message}", هي المفروض مجد  يكون كاتبا عندو ويبعتلي اياها أو أنا بكتبها عند بالسطر يلي قبل
        statusCode: 200,
      );
    } else {
      return RegisterResponse(
        success: false,
        message: "Wrong Sent info❌",
        // message: "${message}", وهي نفس اللي قبلها
        statusCode: status,
      );
    }
  }
}
