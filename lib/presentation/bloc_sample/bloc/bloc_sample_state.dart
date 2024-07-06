part of 'bloc_sample_bloc.dart';

sealed class BlocSampleState extends Equatable {
  const BlocSampleState();

  @override
  List<Object> get props => [];
}

final class BlocSampleInitial extends BlocSampleState {}

final class BlocSampleLoading extends BlocSampleState {}

final class BlocSampleLoadded extends BlocSampleState {
  final List<EmployeeEntity> employeeEntites;

  const BlocSampleLoadded(this.employeeEntites);
}

final class BlocSampleAdding extends BlocSampleState {}

final class BlocSampleAdded extends BlocSampleState {}

final class BlocSampleError extends BlocSampleState {}
