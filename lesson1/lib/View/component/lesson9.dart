import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return TextButton(
              child: Text('show snackbar'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink,
                primary: Colors.white, // Màu chữ
              ),
              onPressed: () {
                final snackBar = SnackBar(content: Text('Nội dung gì đó!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}
