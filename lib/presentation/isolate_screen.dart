import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

void heavyCompution2(List<dynamic> args) {
  SendPort sendPort = args[0];
  int sum = args[1];
  for (var i = 0; i < 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

void heavyCompution(SendPort sendPort) {
  var sum = 0;
  for (var i = 0; i < 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

class _IsolateScreenState extends State<IsolateScreen> {
  String compute = "0";
  Future _startHeavyCompution() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(
        heavyCompution2, [receivePort.sendPort, int.parse(compute)]);

    receivePort.listen(
      (message) {
        setState(() {
          compute = message.toString();
        });
        receivePort.close();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  _startHeavyCompution();
                },
                child: const Text("Compute")),
            const SizedBox(
              height: 100,
            ),
            Text(compute),
            const SizedBox(
              height: 100,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
