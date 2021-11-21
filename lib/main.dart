import 'package:cactus33_helper/logic/points_info.dart';
import 'package:cactus33_helper/view/keyboard.dart';
import 'package:cactus33_helper/view/number_map_widget.dart';
import 'package:prepare_widget/prepare_widget.dart';

import 'logic/logic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final NumberMapController mapController = NumberMapController((controller) {
    final points = controller.info;
    controller.nextLine = chooseCache.nextLineSmartOf(points);
    controller.nextPosition =
        controller.nextLine != null || points.knownCount == 0
            ? null
            : chooseCache.positions[controller.info.hashCode]?.position;
  });

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumberMapController get mapController => widget.mapController;

  int? get selected => mapController.selected;

  PointsInfo get info => mapController.info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cactus33 Helper"),
        ),
        body: PrepareWidget(
          loading: Center(child: Text("loading")),
          builder: (BuildContext context) async {
            await load();
            return realBody(context);
          },
        ));
  }

  Widget realBody(BuildContext context) {
    final knownCount = info.knownCount,
        keyBoardAbsorbing = selected == null,
        forbid = selected != null &&
                knownCount == 4 &&
                info[selected!] == unKnownNumber
            ? info.numbersUnknown.toSet()
            : <int>{};
    return Center(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: NumberMapWidget(mapController, () => setState(() {})),
            ),
          ),
          Card(
            child: Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () => setState(() => mapController.clear()),
                        child: Text("全部重置"))),
                Expanded(
                    child: TextButton(
                        onPressed: () =>
                            setState(() => mapController.update(unKnownNumber)),
                        child: Text("重置")))
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: KeyBoard(
                absorbing: keyBoardAbsorbing,
                onNumberTap: (number) {
                  mapController.update(number);
                  mapController.selected = mapController.nextPosition;
                },
                forbid: forbid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
