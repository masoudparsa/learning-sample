import 'package:flutter_application_new_card/data/repositories/employee_repositiry_impl.dart';
import 'package:flutter_application_new_card/domain/repositories/employee_repositiry.dart';
import 'package:flutter_application_new_card/domain/usecases/get_cards_usecase.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/bloc_complex_bloc.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void setup() {
    serviceLocator
        .registerFactory<EmployeeRepository>(() => EmployeeRepositoryImpl());

    serviceLocator.registerFactory<GetEmployeesUsecase>(
        () => GetEmployeesUsecase(serviceLocator()));

    serviceLocator.registerSingleton(BlocSampleBloc(serviceLocator()));
    serviceLocator.registerSingleton(BlocComplexBloc(serviceLocator()));
  }
}
