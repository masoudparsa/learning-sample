part of 'bloc_sample_bloc.dart';

sealed class BlocSampleEvent extends Equatable {
  const BlocSampleEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeesEvent extends BlocSampleEvent {}

class AddEmployeeEvent extends BlocSampleEvent {
  final EmployeeEntity employeeEntity;

  const AddEmployeeEvent(this.employeeEntity);
}
