// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final String name;
  final String family;
  final int age;
  const EmployeeEntity({
    required this.name,
    required this.family,
    required this.age,
  });

  EmployeeEntity copyWith({
    String? name,
    String? family,
    int? age,
  }) {
    return EmployeeEntity(
      name: name ?? this.name,
      family: family ?? this.family,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'family': family,
      'age': age,
    };
  }

  factory EmployeeEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeEntity(
      name: map['name'] as String,
      family: map['family'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeEntity.fromJson(String source) =>
      EmployeeEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, family, age];
}
