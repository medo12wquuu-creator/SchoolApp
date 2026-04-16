import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/colors.constants.dart';
import 'package:school_app/core/theme/theme_cubit.dart';
import 'package:school_app/features/otp/presentation/views/otp.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final phoneController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: ListView(
        children: [
          //                                                                               FirstName field        //
          SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: firstNameController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                    color: kSecondlyColor,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                    125,
                    41,
                    211,
                    230,
                  ).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? "First name is required" : null,
              ),
            ),
          ),
          //                                                                               LastName field        //
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: lastNameController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(Icons.person, color: kSecondlyColor),
                  filled: true,
                  fillColor: const Color.fromARGB(
                    125,
                    41,
                    211,
                    230,
                  ).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Last name is required" : null,
              ),
            ),
          ),
          //                                                                               Email field        //
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: emailController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: kSecondlyColor,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                    125,
                    41,
                    211,
                    230,
                  ).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) return "Email is required";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
            ),
          ),
          //                                                                               phonNumber field        //
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Phone number 09XXXXXXXX",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(
                    Icons.phone_in_talk_sharp,
                    color: kSecondlyColor,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(
                    125,
                    41,
                    211,
                    230,
                  ).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone Number is required";
                  } else if (value.length < 10) {
                    return "Phone Number is lower than 10 numbers, try again";
                  } else if (value.length > 10) {
                    return "Phone Number is more than 10 numbers, try again";
                  } else
                    return null;
                },
              ),
            ),
          ),
          //                                                                               password field        //
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(Icons.lock, color: kSecondlyColor),
                  filled: true,
                  fillColor: const Color.fromARGB(
                    125,
                    41,
                    211,
                    230,
                  ).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: (value) => value!.length < 6
                    ? "Password must be at least 6 characters"
                    : null,
              ),
            ),
          ),
          //                                                                               Register Button        //
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("تم إرسال طلبك، يرجى انتظار الموافقة "),
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => OtpPage()),
                );
              }
              // هنا تستدعي الـ Cubit أو ViewModel للتسجيل
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Register", style: TextStyle(fontSize: 18)),
          ),

          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
