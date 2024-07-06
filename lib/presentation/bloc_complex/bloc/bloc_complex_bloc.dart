import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new_card/core/constant/consts.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/add_employee_status.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/get_employees_status.dart';

part 'bloc_complex_event.dart';
part 'bloc_complex_state.dart';

class BlocComplexBloc extends Bloc<BlocComplexEvent, BlocComplexState> {
  final GetEmployeesUsecase getEmployeesUsecase;
  BlocComplexBloc(this.getEmployeesUsecase)
      : super(BlocComplexState(
            getEmployeesStatus: GetEmployeesStatus.initial(),
            addEmployeeStatus: AddEmployeeStatus.initial())) {
    on<BlocComplexEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetEmployeesComplexEvent>(_getEmployees);
    on<AddEmployeeComplexEvent>(_addEmployee);
  }

  FutureOr<void> _getEmployees(
      GetEmployeesComplexEvent event, Emitter<BlocComplexState> emit) async {
    try {
      emit(state.copyWith(
          getEmployeesStatus:
              state.getEmployeesStatus.copyWith(state: BlocState.loading)));
      var employeeEntites = await getEmployeesUsecase();

      emit(state.copyWith(
          getEmployeesStatus: state.getEmployeesStatus.copyWith(
              state: BlocState.loaded, employeeEntites: employeeEntites)));

      throw Exception("error in b loc complex");
    } catch (e) {
      emit(state.copyWith(
          getEmployeesStatus:
              state.getEmployeesStatus.copyWith(state: BlocState.error)));

      addError(e);
    }
  }

  FutureOr<void> _addEmployee(
      AddEmployeeComplexEvent event, Emitter<BlocComplexState> emit) async {
    try {
      emit(state.copyWith(
          addEmployeeStatus:
              state.addEmployeeStatus.copyWith(state: BlocState.adding)));
      await Future.delayed(const Duration(seconds: 3));

      // add to Repository
      var employees = state.getEmployeesStatus.employeeEntites;
      employees.add(event.employeeEntity);
      emit(state.copyWith(
          addEmployeeStatus:
              state.addEmployeeStatus.copyWith(state: BlocState.added),
          getEmployeesStatus:
              state.getEmployeesStatus.copyWith(employeeEntites: employees)));
    } catch (e) {
      emit(state.copyWith(
          addEmployeeStatus:
              state.addEmployeeStatus.copyWith(state: BlocState.adding)));
    }
  }
}
