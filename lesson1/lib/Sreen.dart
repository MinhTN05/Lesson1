import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // xóa debug ở góc phải trên màn hình
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: buildHomeScreen(),
    ),
  );
}

Widget buildHomeScreen() {
  return Scaffold(
    appBar: AppBar(
      title: Text('My Test Home Page'),
    ),
    body: Center(
      child: Column(
        children: [
          // Text('Home Screen'),
          Image.network(
            'https://i.pinimg.com/564x/5e/04/9e/5e049e87cc382991a8420494c54ad5e8.jpg',
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/1f431ca0fd1c550434962feae78681f2.jpg',
            width: 200,),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
