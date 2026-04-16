import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // Controllers لكل خانة
  final List<TextEditingController> controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  String numberCode = ""; // هنا نخزن الكود النهائي

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void nextField(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void collectOtp() {
    numberCode = controllers.map((c) => c.text).join();
    print("OTP Entered: $numberCode");
    // هنا يمكنك استخدام numberCode لإرساله للسيرفر أو التحقق
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Text(
                  "You will recive a code of 5 numbers\n                on your Email. \n\n         Chech it and Write here : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: 55,
                  height: 60,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => nextField(value, index),
                  ),
                );
              }),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: collectOtp,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Verify", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
