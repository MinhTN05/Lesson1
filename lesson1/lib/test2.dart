import 'package:flutter/material.dart';

void main() {
  runApp(MyTestApp());
}

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: MyTestHomePage());
  }
}

class MyTestHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var soLanBamNut = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('My test home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đây là page 2'),
            ElevatedButton(
                onPressed: () {
                  soLanBamNut++;
                  print('nút đã đã đươc bấm: $soLanBamNut');
                },
                child: Text('Click me!!!'))
          ],
        ),
      ),
    );
  }
}
