import 'package:flutter/material.dart';
import 'package:school_app/core/constants/images.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Create Your Account \n Dear Student :",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Image.asset(logo, width: 100, height: 100, fit: BoxFit.contain),
      ],
    );
  }
}
