import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String shape = "None";
  int shapeVal = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.redAccent,
              ],
              begin: Alignment.topLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (shapeVal == 1)
                          ? Container(
                              height: 120,
                              width: 120,
                            )
                          : Draggable<String>(
                              data: "Circle",
                              child: _customCircle(),
                              feedback: _customCircle(),
                              childWhenDragging: Container(),
                            ),
                      (shapeVal == 2)
                          ? Container(
                              height: 120,
                              width: 120,
                            )
                          : Draggable<String>(
                              data: "Squircle",
                              child: _customContainer(),
                              feedback: _customContainer(),
                              childWhenDragging: Container(),
                            )
                    ],
                  ),
                ),
                Column(
                  children: [
                    DragTarget<String>(
                      builder: (_, accepted, rejected) => Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: (shapeVal == 0)
                              ? Container()
                              : (shapeVal == 1)
                                  ? _customCircle()
                                  : _customContainer(),
                        ),
                      ),
                      onWillAccept: (data) => true,
                      onAccept: (data) {
                        setState(() {
                          if (data == "Circle") {
                            shapeVal = 1;
                          } else {
                            shapeVal = 2;
                          }
                          shape = data;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          shapeVal = 0;
                          shape = "None";
                        });
                      },
                      child: Text(
                        "Clear Stack",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Text(
                  "$shape\nSelected",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customCircle() {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white,
    );
  }

  Widget _customContainer() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
