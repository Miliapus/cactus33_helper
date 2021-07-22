import 'package:cactus33_helper/logic/basic_tool.dart';
import 'package:cactus33_helper/view/keyboard.dart';
import 'package:cactus33_helper/view/number_map_widget.dart';

import 'logic/choose.dart';
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
  final NumberMapController mapController = NumberMapController((controller) {
    controller.nextLine = null;
    controller.nextPosition = null;

    if (controller.info.length == 4) {
      controller.nextLine =
          chooseCache.lines[controller.info.infoList.hash]!.line;
    } else if (controller.info.length > 0) {
      controller.nextPosition =
          chooseCache.positions[controller.info.infoList.hash]!.position;
    }
  });

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPrepared = false;

  NumberMapController get mapController => widget.mapController;

  int? get selected => mapController.selected;

  Map<int, int> get info => mapController.info;

  @override
  void initState() {
    super.initState();
    load().then((_) => setState(() {
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

  Widget realBody(BuildContext context) {
    final keyBoardAbsorbing =
        selected == null || (info.length == 4 && !info.containsKey(selected));
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: NumberMapWidget(mapController, () => setState(() {})),
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () => mapController.clear(),
                      child: Text("全部重置"))),
              Expanded(
                  child: TextButton(
                      onPressed: () => mapController.update(null),
                      child: Text("重置")))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: KeyBoard(
              absorbing: keyBoardAbsorbing,
              onNumberTap: (number) {
                mapController.update(number);
                mapController.selected = mapController.nextPosition;
              },
              forbid: info.values.toList(),
            ),
          ),
        ],
      ),
    );
  }
}
