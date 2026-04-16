import 'package:flutter/material.dart';
import 'register_header.dart';
import 'register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              RegisterHeader(),

              Expanded(child: RegisterForm()),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
