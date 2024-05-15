import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'MinhTN';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MinhTN', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                  )),
              Container(
                color: Colors.blue,
                height: 200,
                // width: 100,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    width: 100,
                  )),
              Container(
                color: Colors.blue,
                height: 100,
                // width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
