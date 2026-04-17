import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/colors.constants.dart';
import 'package:school_app/core/theme/theme_cubit.dart';
import 'package:school_app/features/otp/presentation/views/otp.dart';
import 'package:school_app/features/register/presentation/view_models/register_cubit.dart';

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
          SizedBox(height: 30),
          // ======================= First Name Field =======================
          Text(
            "First Name",
            style: TextStyle(color: Color.fromARGB(255, 55, 165, 255)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: firstNameController,
                onChanged: (v) => context.read<RegisterCubit>().setFirstName(v),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(
                    Icons.person_outline, // ← تم تصحيح الأيقونة
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
          SizedBox(height: 16),

          // ======================= Last Name Field =======================
          Text(
            "Last Name",
            style: TextStyle(color: Color.fromARGB(255, 55, 165, 255)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: lastNameController,
                onChanged: (v) => context.read<RegisterCubit>().setLastName(v),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: const TextStyle(color: kHintTextColor),
                  prefixIcon: const Icon(
                    Icons.person, // أيقونة مناسبة للاسم الأخير
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
                    value!.isEmpty ? "Last name is required" : null,
              ),
            ),
          ),
          SizedBox(height: 16),

          // ======================= Email Field =======================
          Text(
            "Email Address",
            style: TextStyle(color: Color.fromARGB(255, 55, 165, 255)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => context.read<RegisterCubit>().setEmail(v),
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
          SizedBox(height: 16),

          // ======================= Phone Number Field =======================
          Text(
            "Phone Number",
            style: TextStyle(color: Color.fromARGB(255, 55, 165, 255)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                onChanged: (v) => context.read<RegisterCubit>().setPhone(v),
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
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 16),

          // ======================= Password Field =======================
          Text(
            "Password",
            style: TextStyle(color: Color.fromARGB(255, 55, 165, 255)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TextFormField(
                controller: passwordController,
                obscureText: true, // إخفاء كلمة المرور
                onChanged: (v) => context.read<RegisterCubit>().setPassword(v),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: "Enter your password",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 30),

          // ====================== Register Button ========================
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<RegisterCubit>().register();
              }
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
