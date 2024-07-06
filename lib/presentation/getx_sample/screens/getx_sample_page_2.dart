import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/getx/employee_getx_controller.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/getx/employee_getx_controller_2.dart';
import 'package:get/get.dart';

class GetxSampleScreen2 extends StatefulWidget {
  const GetxSampleScreen2({super.key});

  @override
  State<GetxSampleScreen2> createState() => _GetxSampleScreen2State();
}

class _GetxSampleScreen2State extends State<GetxSampleScreen2> {
  var controller = Get.find<EmployeeGetXConroller2>();
  @override
  void initState() {
    Get.find<EmployeeGetXConroller2>().getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("GetxSample"),
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: controller.obx(
            (state) => Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("نام:"),
                                        Text(controller
                                            .employeeEntities[index].name)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("نام خانوادگی:"),
                                        Text(controller
                                            .employeeEntities[index].family)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("سن:"),
                                        Text(controller
                                            .employeeEntities[index].age
                                            .toString())
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: controller.employeeEntities.length))
              ],
            ),
            onLoading: CircularProgressIndicator(),
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.find<EmployeeGetXConroller>().addEmployee(
              const EmployeeEntity(name: "مسعود", family: "پارسا", age: 10));
        },
      ),
    );
  }
}
