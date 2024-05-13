

import 'package:flutter/material.dart';

void main () {
  int solanbannut = 0;
  runApp(
    MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Test Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Day la Page 2'),
              ElevatedButton(
                  onPressed: () {
                    solanbannut++;
                    print("Nut da duoc bam! $solanbannut");
              }, child: Text("Click me!!!"))
            ],
          ),
        ),
      ),
    )
  );
}