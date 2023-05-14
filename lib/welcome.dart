import 'package:flutter/material.dart';
import 'package:medical_diagnosis_app/mainscreen.dart';
// import 'login.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Medical Diagnosis App"),
          ),
        ],
      ),
    );
  }
}

class Middlepart extends StatelessWidget {
  const Middlepart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Your virtual doctor right at your fingertips",
                  style: TextStyle(fontSize: 20),
                ),
                Text("An AI driven medical diagnosis system and much more...")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/welcome.jpg",
              height: 250,
            ),
          )
        ],
      ),
    );
  }
}

class BottomPart extends StatefulWidget {
  const BottomPart({super.key});

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  //When Checked...
                  setState(() {
                    if (value == true) {
                      isChecked = true;
                    }
                  });
                },
              )),
          const Text(
              "I agree to the terms and \nconditions of using this application",
              style: TextStyle()),
        ],
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: TextButton(
            onPressed: () {
              if (isChecked) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              }
            },
            child: const Text("Get Started"),
          ),
        ),
      ),
    ]);
  }
}

class WelcomeScreen extends StatelessWidget {
  final bool isChecked = false;
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(0, 255, 255, 232),
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: WelcomeHeading(),
          ),
          Expanded(
            flex: 2,
            child: Middlepart(),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: BottomPart(),
            ),
          )
        ],
      ),
    );
  }
}
