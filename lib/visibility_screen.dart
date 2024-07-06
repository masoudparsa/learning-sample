import 'package:flutter/material.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  bool show = true;
  double opac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible: true,
              child: Container(
                color: Colors.amber,
                height: 150,
                width: 200,
                child: Text("this is test"),
              ),
            ),
            Opacity(
              opacity: opac,
              child: Container(
                color: Colors.red,
                height: 150,
                width: 200,
                child: IgnorePointer(
                  ignoring: opac != 0 ? false : true,
                  child: ElevatedButton(
                      onPressed: () {
                        print("object");
                      },
                      child: Text("sddf")),
                ),
              ),
            ),
            Offstage(
              offstage: false,
              child: Container(
                color: Colors.black,
                height: 150,
                width: 200,
                child: Text("this is test"),
              ),
            ),
            if (show)
              Container(
                color: Colors.orange,
                height: 150,
                width: 200,
                child: Text("this is test"),
              )
          ],
        ),
      ),
    );
  }
}
