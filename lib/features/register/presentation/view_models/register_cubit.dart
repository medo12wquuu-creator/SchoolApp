import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/features/register/data/repositories/register_repository.dart';
import 'package:school_app/features/register/presentation/view_models/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repo;

  RegisterCubit(this.repo) : super(RegisterInitial());

  // المتغيرات التي سيتم تعبئتها من TextFields
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String password = '';

  // دوال تحديث القيم
  void setFirstName(String v) => firstName = v;
  void setLastName(String v) => lastName = v;
  void setEmail(String v) => email = v;
  void setPhone(String v) => phone = v;
  void setPassword(String v) => password = v;

  // دالة التسجيل
  Future<void> register() async {
    emit(RegisterLoading());

    final result = await repo.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );

    if (result.success) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError(result.message));
    }
  }
}
