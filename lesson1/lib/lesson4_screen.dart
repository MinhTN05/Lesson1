import 'package:flutter/material.dart';
import 'package:lesson1/list_view_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Core Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: ROUTE_HOME_VIEW,
      routes: {
        ROUTE_HOME_VIEW: (context) => const MyStatelessWidget(),
        ROUTE_LIST_VIEW: (context) => ListViewScreen(''),
      },
      theme: ThemeData(
          dividerTheme: const DividerThemeData(
        thickness: 1,
        color: Colors.brown,
        // indent và endIndent thay đổi kích thước cửa gạch sau mỗi items
        indent: 10,
        endIndent: 10,
      )),
    );
  }
}

const ROUTE_HOME_VIEW = '/';
const ROUTE_LIST_VIEW = '/list_view_screen';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Column Sample'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Column(
              children: <Widget>[
                buildStack(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 300,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Container(
                          color: Colors.redAccent,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.brown,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.greenAccent,
                    width: 100,
                    height: 300,
                  ),
                ),
                buildDecorationText(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var result = await Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ListViewScreen('Dữ liệu truyền từ Screen 1');
                    }));

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.toString())));
                  },
                  child: const Text('Go to Sreen 2'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    var result = await Navigator.pushNamed(
                        context, ROUTE_LIST_VIEW,
                        arguments: 'Dữ liệu truyền từ Screen 1 Ahihi');

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.toString())));
                  },
                  child: const Text('Go to Sreen 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildStack() {
  return Stack(
    alignment: AlignmentDirectional.topEnd,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 90,
        height: 90,
        color: Colors.green,
      ),
      Container(
        width: 80,
        height: 80,
        color: Colors.blue,
      ),
    ],
  );
}

Widget buildDecorationText() {
  return SizedBox(
    width: 250,
    height: 250,
    child: Stack(
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          color: Colors.white,
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.black.withAlpha(0),
                Colors.black12,
                Colors.black45
              ])),
          child: const Text(
            'Foreground text',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        )
      ],
    ),
  );
}
