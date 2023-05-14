import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:
            const EdgeInsets.only(top: 150, bottom: 50, right: 50, left: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Expanded(
              flex: 1,
              child: Text("Medical_Diagnosis"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: false,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Login",
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Signup",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}




// Scaffold(
//       body: Container(
//         margin:
//             const EdgeInsets.only(top: 150, bottom: 50, right: 50, left: 50),
//         child: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             const Expanded(
//               flex: 1,
//               child: Text("Medical_Diagnosis"),
//             ),
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: EmailWidget(sendEmail),
//               ),
//             ),
//             const Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter Password',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 1,
//                 child: LoginButton(), 
//                 )
//           ]),
//         ),
//       ),
//     )
