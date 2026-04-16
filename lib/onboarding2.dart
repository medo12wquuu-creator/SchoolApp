// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:myproj/Login2.dart';
import 'onboarding3.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Text("2 of 3", style: TextStyle(fontSize: 16)),
        // automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: 2 / 3,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
      ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 200),

          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "onboarding2",
              // .tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(height: 210),

          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingPage3()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (_) => LoginScreen2()),
              // );
            },
            child: const Text("Skip", style: TextStyle(color: Colors.black)),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
