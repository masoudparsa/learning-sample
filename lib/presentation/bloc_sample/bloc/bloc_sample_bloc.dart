import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/domain/usecases/get_cards_usecase.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';

part 'bloc_sample_event.dart';
part 'bloc_sample_state.dart';

class BlocSampleBloc extends Bloc<BlocSampleEvent, BlocSampleState> {
  final GetEmployeesUsecase getEmployeesUsecase;
  BlocSampleBloc(this.getEmployeesUsecase) : super(BlocSampleInitial()) {
    on<BlocSampleEvent>((event, emit) {
      // TODO: implement event handler
    });

    // on<GetEmployeesEvent>(
    //   (event, emit) {

    //   },
    // );

    on<GetEmployeesEvent>(_getEmployees);
    on<AddEmployeeEvent>(_addEmployee);
  }

  FutureOr<void> _getEmployees(
      GetEmployeesEvent event, Emitter<BlocSampleState> emit) async {
    try {
      emit(BlocSampleLoading());
      var employeeEntites = await getEmployeesUsecase();

      emit(BlocSampleLoadded(employeeEntites));
      // throw Exception("get employee error");
    } catch (e) {
      emit(BlocSampleError());
      addError(e);
    }
  }

  FutureOr<void> _addEmployee(
      AddEmployeeEvent event, Emitter<BlocSampleState> emit) async {
    try {
      emit(BlocSampleAdding());
      await Future.delayed(Duration(seconds: 3));

      // add to Repository

      emit(BlocSampleAdded());
    } catch (e) {
      emit(BlocSampleError());
    }
  }
}
