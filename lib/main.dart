import 'package:cactus33_helper/view/keyboard.dart';
import 'package:cactus33_helper/view/number_map_widget.dart';

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
    final points = controller.info.infoList;
    controller.nextLine = chooseCache.nextLineOf(points);
    controller.nextPosition = controller.nextLine != null || points.isEmpty
        ? null
        : chooseCache.positions[controller.info.infoList.hash]?.position;
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
    final keyBoardAbsorbing = selected == null;
    final forbid = info.length == 4 ? <int>{} : <int>{};
    // if(mapController.nextLine != null)
    //     (mapController.nextLine != null && !info.containsKey(selected));
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
                            setState(() => mapController.update(null)),
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
                unSuggest: mapController.nextLine != null
                    ? info.values.toList()
                    : info.values.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
