import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/domain/repositories/employee_repositiry.dart';

class GetEmployeesUsecase {
  final EmployeeRepository employeeRepository;

  GetEmployeesUsecase(this.employeeRepository);
  Future<List<EmployeeEntity>> call() async {
    return await employeeRepository.getEmployees();
  }
}
