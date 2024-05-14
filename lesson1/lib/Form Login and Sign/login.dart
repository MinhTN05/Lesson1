import 'package:flutter/material.dart';
import 'package:lesson1/Form%20Login%20and%20Sign/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void login() {
    var userName = userTextController.text;
    var password = passwordTextController.text;
    if (userName.length < 6 || password.length < 6) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Email or password invalid"),
            );
          });
      return;
    }

    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(userName);

    if (!emailValid) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Sai email"),
            );
          });
      return;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (c) => HomeScreen(userName)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: userTextController,
                  decoration: const InputDecoration(
                      hintText: "User name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintStyle: TextStyle(color: Color(0xffCCCCCC))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color(0xffCCCCCC))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: login,
                ),
              ],
            )));
  }
}
