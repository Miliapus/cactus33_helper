import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'choose.dart';
import 'pb/model.pb.dart';
import 'package:path_provider/path_provider.dart';

late Map<int, int> positionChoose;
late Map<int, int> lineChoose;

Future<void> load() async {
  final receive = ReceivePort();
  final path = (await getApplicationSupportDirectory()).path;
  await Isolate.spawn(isolateEntryFunction, [receive.sendPort,path]);
  Uint8List list = await receive.first;
  print("receive finish");
  chooseCache = ChooseCache.fromBuffer(list);
  print("${chooseCache.lines.length} ${chooseCache.positions.length}");
}

void isolateEntryFunction(List sendPortAndPath) async {
  SendPort sendPort = sendPortAndPath.first;
  String path = sendPortAndPath.last;
  try {
    File file = File(path + "/data.txt");
    final exists =await file.exists();
    if (exists) {
      final data = await file.readAsBytes();
      print("data length ${data.length}");
      print("read finish");
      sendPort.send(data);
    } else {
      chooseNext([]);
      final data = chooseCache.writeToBuffer();
      await file.create();
      await file.writeAsBytes(data);
      sendPort.send(data);
    }
  } catch (e) {
    print(e);
  }
}
