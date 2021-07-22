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
  await Isolate.spawn(isolateEntryFunction, receive.sendPort);

  SendPort sender = await receive.first;
  final path = (await getApplicationSupportDirectory()).path;
  final receive2 = ReceivePort();
  sender.send([path,receive2.sendPort]);
  Uint8List list = await receive2.first;
  print("receive finish");
  chooseCache = ChooseCache.fromBuffer(list);
  print("${chooseCache.lines.length} ${chooseCache.positions.length}");
}

void isolateEntryFunction(SendPort sendPort) async {
  final sender = ReceivePort();
  sendPort.send(sender.sendPort);
  final List list = (await sender.first);
  String path = list.first;
  SendPort sendPort2 = list.last;
  try {
    File file = File(path + "/data.txt");
    final exists =await file.exists();
    if (exists) {
      final data = await file.readAsBytes();
      print("data length ${data.length}");
      print("read finish");
      sendPort2.send(data);
    } else {
      chooseNext([]);
      final data = chooseCache.writeToBuffer();
      await file.create();
      await file.writeAsBytes(data);
      sendPort2.send(data);
    }
  } catch (e) {
    print(e);
  }
}
