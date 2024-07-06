// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:flutter_application_new_card/core/constant/consts.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';

class GetEmployeesStatus extends Equatable {
  final BlocState state;
  final List<EmployeeEntity> employeeEntites;
  const GetEmployeesStatus({
    required this.state,
    required this.employeeEntites,
  });

  GetEmployeesStatus copyWith({
    BlocState? state,
    List<EmployeeEntity>? employeeEntites,
  }) {
    return GetEmployeesStatus(
      state: state ?? this.state,
      employeeEntites: employeeEntites ?? this.employeeEntites,
    );
  }

  factory GetEmployeesStatus.initial() {
    return GetEmployeesStatus(
        employeeEntites: List.empty(), state: BlocState.initial);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [state, employeeEntites];
}
