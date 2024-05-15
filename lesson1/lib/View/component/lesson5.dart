import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  late final List<String> items;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    items = List<String>.generate(50, (i) => 'Xem anime $i');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anime',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/7fec547d3477854efda2b76952fef53c.jpg',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      onTap: () {
                        String mess = items[index];

                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(mess)));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
