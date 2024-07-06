part of 'bloc_complex_bloc.dart';

class BlocComplexState extends Equatable {
  final GetEmployeesStatus getEmployeesStatus;
  final AddEmployeeStatus addEmployeeStatus;

  const BlocComplexState(
      {required this.getEmployeesStatus, required this.addEmployeeStatus});

  BlocComplexState copyWith(
      {GetEmployeesStatus? getEmployeesStatus,
      AddEmployeeStatus? addEmployeeStatus}) {
    return BlocComplexState(
        getEmployeesStatus: getEmployeesStatus ?? this.getEmployeesStatus,
        addEmployeeStatus: addEmployeeStatus ?? this.addEmployeeStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [getEmployeesStatus, addEmployeeStatus];
}
