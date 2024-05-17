import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nữ thần - Date a live',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Image.asset(
                        'assets/images/7fec547d3477854efda2b76952fef53c.jpg'),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Tohka Yatogami",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Date a live",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
              const Divider(
                thickness: 2,
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kotori Itsuka",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Date a live",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset('assets/images/depvl.jpg'),
                  ),
                ],
              )),
              const Divider(
                thickness: 2,
              ),
              Flexible(
                  child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Image.asset('assets/images/sieungau.jpg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kurumi Tokisaki",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Date a live",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ]),
      ),
    );
  }
}
