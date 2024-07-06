import 'package:dio/dio.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/domain/repositories/employee_repositiry.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  @override
  Future<List<EmployeeEntity>> getEmployees() async {
    var result = await Dio().get(
        "https://dev-77kufm6dlmvfrfw.api.raw-labs.com/mytest/endpoint/employee");
    var items = result.data as List<dynamic>;
    return items.map((e) => EmployeeEntity.fromMap(e)).toList();
  }
}
