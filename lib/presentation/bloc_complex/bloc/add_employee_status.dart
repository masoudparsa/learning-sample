// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_application_new_card/core/constant/consts.dart';

class AddEmployeeStatus extends Equatable {
  final BlocState state;
  const AddEmployeeStatus({
    required this.state,
  });

  AddEmployeeStatus copyWith({
    BlocState? state,
  }) {
    return AddEmployeeStatus(
      state: state ?? this.state,
    );
  }

  factory AddEmployeeStatus.initial() {
    return const AddEmployeeStatus(state: BlocState.initial);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [state];
}
