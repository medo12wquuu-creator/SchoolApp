import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:school_app/features/otp/presentation/views/otp.dart';
import 'package:school_app/features/register/data/datasources/register_remote_data_source.dart';
import 'package:school_app/features/register/data/repositories/register_repository.dart';
import 'package:school_app/features/register/presentation/view_models/register_cubit.dart';
import 'package:school_app/features/register/presentation/view_models/register_state.dart';
import 'package:school_app/features/register/presentation/views/widget/register1_body.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RegisterCubit(RegisterRepository(RegisterRemoteDataSource(Dio()))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              title: "Processing",
              desc: "Please wait...",
            ).show();
          }

          if (state is RegisterSuccess) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              title: "Accepted",
              desc: "Your account has been approved!",
              btnOkOnPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OtpPage()),
                );
              },
            ).show();
          }

          if (state is RegisterError) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              title: "Pending",
              desc: "Your account is under review. Please wait for approval.",
            ).show();
          }
        },
        builder: (context, state) {
          return RegisterBody();
        },
      ),
    );
  }
}
