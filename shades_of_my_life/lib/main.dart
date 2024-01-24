import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int shades = 14038148;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              double height = MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top;
              shades = (details.localPosition.dy / height * 16777215).round();
              if (shades < 0) {
                shades = 0;
              }
              if (shades > 16777215) {
                shades = 16777215;
              }
              //  print(details.localPosition.dy);
              //  print(MediaQuery.of(context).size.height);
              //  print(MediaQuery.of(context).padding.top);
            });
          },
          onTapDown: (details) {
            setState(() {
              double height = MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top;
              shades = (details.localPosition.dy / height * 16777215).round();
              //  print(details.localPosition.dy);
              //  print(MediaQuery.of(context).size.height);
              //  print(MediaQuery.of(context).padding.top);
            });
          },
        )),
        backgroundColor: Color(0xFF000000 + shades),
      ),
    );
  }
}
