part of 'bloc_complex_bloc.dart';

sealed class BlocComplexEvent extends Equatable {
  const BlocComplexEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeesComplexEvent extends BlocComplexEvent {}

class AddEmployeeComplexEvent extends BlocComplexEvent {
  final EmployeeEntity employeeEntity;

  const AddEmployeeComplexEvent(this.employeeEntity);
}
