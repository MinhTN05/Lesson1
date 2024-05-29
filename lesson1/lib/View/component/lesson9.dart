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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
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
            FrogColor(
              color: Colors.green,
              child: Builder(
                builder: (BuildContext innerContext) {
                  return Text(
                    'Hello Frog',
                    style: TextStyle(color: FrogColor.of(innerContext).color),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FrogColor extends InheritedWidget {
  const FrogColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    final FrogColor? result =
        context.dependOnInheritedWidgetOfExactType<FrogColor>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}
