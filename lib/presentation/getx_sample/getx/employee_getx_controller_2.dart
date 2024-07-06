import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';
import 'package:get/get.dart';

class EmployeeGetXConroller2 extends GetxController with StateMixin {
  final GetEmployeesUsecase getEmployeesUsecase;

  //var state = MyState.initial.obs;

  var employeeEntities = <EmployeeEntity>[];
  EmployeeGetXConroller2(this.getEmployeesUsecase);

  Future getEmployees() async {
    try {
      //  state.value = MyState.loading;
      change(null, status: RxStatus.loading());
      employeeEntities = await getEmployeesUsecase();
      change(employeeEntities, status: RxStatus.success());
      //state.value = MyState.loaded;
    } catch (e) {
      change(e, status: RxStatus.error());
      //state.value = MyState.error;
    }
  }

  Future addEmployee(EmployeeEntity employeeEntity) async {
    try {
      state.value = MyState.adding;
      await Future.delayed(Duration(seconds: 3));

      // add to Repository
      employeeEntities.add(employeeEntity);
      state.value = MyState.added;
    } catch (e) {
      state.value = MyState.error;
    }
  }
}

enum MyState { initial, loading, loaded, adding, added, error }
