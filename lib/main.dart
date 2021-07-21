import 'package:cactus33_helper/view/number_map_widget.dart';

import 'logic/load.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPrepared = false;

  @override
  void initState() {
    super.initState();
    load().then((_) => setState((){
      isPrepared = true;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cactus33 Helper"),
      ),
      body: isPrepared ? realBody(context) : loading(context),
    );
  }

  Widget loading(BuildContext context) => Center(child: Text("loading"));

  Widget realBody(BuildContext context) => Center(child:
  Column(
    children: [
      NumberMapWidget(NumberMapController()),
    ],
  ));
}