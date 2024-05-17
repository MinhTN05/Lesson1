import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson1/StackPage.dart';
import 'FlexDemo2.dart';
import 'Page6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerTheme: const DividerThemeData(
            space: 10,
            color: Colors.red,
            indent: 1,
            thickness: 10,
            endIndent: 1),
        fontFamily: 'Georgia',
      ),
      home: const MyHomePage(title123: 'Flutter Demo 20221'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title123}) : super(key: key);
  final String title123;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Theme(
        data: Theme.of(context).copyWith(hintColor: Colors.yellow),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title123),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return Page6();
                    },
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next_rounded),
                tooltip: 'Go to the next page',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return FlexDemo2();
                    },
                  ));
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(18.0),
              color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Deliver features faster',
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Text('Craft beautiful UIs',
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          // otherwise the logo will be tiny
                          child: FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: <Widget>[
                      FlutterLogo(),
                      Expanded(
                        child: Text(
                            "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                      ),
                      Icon(Icons.sentiment_very_satisfied),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: btnStyle,
                    onPressed: null,
                    child: const Text('Disabled'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: btnStyle,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Btn Pressed 20221')));

                      Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return StackPage();
                        },
                      ));
                    },
                    child: const Text('Enabled'),
                  ),
                ],
              ),
            )),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(height: 50.0),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.plus_one),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
