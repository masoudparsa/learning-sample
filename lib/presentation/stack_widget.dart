import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.amber,
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              child: Icon(Icons.abc),
              start: 10,
              top: 20,
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              child: Icon(Icons.tiktok_rounded),
              start: 100,
              bottom: 50,
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              end: 0,
              top: 0,
              child: ElevatedButton(
                  onPressed: () async {
                    // var employeeUsecase = GetEmployeesUsecase();
                    // var result = await employeeUsecase();
                    //  print(result);
                  },
                  child: const Text("get employees")),
            )
          ],
        ),
      ),
    );
  }
}
