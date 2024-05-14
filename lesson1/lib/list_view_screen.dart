import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  String _sData;

  ListViewScreen(this._sData, {Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState(_sData);
}

class _ListViewScreenState extends State<ListViewScreen> {
  String _sData;

  _ListViewScreenState(this._sData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_sData),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(
                      child: Text('Entry A'),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(
                      child: Text('Entry B'),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(
                      child: Text('Entry C'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildListView2(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        countAddItem++;
                        entries.add(countAddItem.toString());
                        colorCodes.add(200 - countAddItem * 20);
                      });
                    },
                    child: const Text('Add items !!!')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (countAddItem != 0) {
                          countAddItem--;
                          entries.removeLast();
                          colorCodes.removeLast();
                        }
                      });
                    },
                    child: const Text('Remove items !!!')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, entries);
                },
                child: const Text('Back to Screen 1')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //add
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  int countAddItem = 0;

  List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];

  List<int> colorCodes = <int>[600, 500, 400, 300, 200];

  Widget buildListView2() {
    //ListView.builder lấy theo dữ liệu động
    // return Container(
    //   height: 150,
    //   child: ListView.builder(
    //     padding: const EdgeInsets.all(8),
    //     itemCount: entries.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         height: 50,
    //         color: Colors.green[colorCodes[index]],
    //         child: Center(
    //           child: Text('Items ${entries[index]}'),
    //         ),
    //       );
    //     },
    //   ),
    // );

    // ListView.separated
    return Container(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Items ${entries[index]}')),
              );
            },
            child: Container(
              height: 50,
              color: Colors.green[colorCodes[index]],
              child: Center(
                child: Text('Items ${entries[index]}'),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
