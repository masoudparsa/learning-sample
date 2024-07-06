import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/core/constant/consts.dart';
import 'package:flutter_application_new_card/core/constant/service_locator.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/bloc_complex_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocComplexPage extends StatefulWidget {
  const BlocComplexPage({super.key});

  @override
  State<BlocComplexPage> createState() => _BlocComplexPageState();
}

class _BlocComplexPageState extends State<BlocComplexPage> {
  @override
  void initState() {
    serviceLocator.get<BlocComplexBloc>().add(GetEmployeesComplexEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("BlocComplex"),
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child:
              // BlocListener<BlocSampleBloc, BlocSampleState>(
              //     listener: (context, stateListener) {
              //   if (stateListener is BlocSampleAdded) {
              //     BlocProvider.of<BlocSampleBloc>(context).add(GetEmployeesEvent());
              //   }
              // }, child:

              BlocConsumer<BlocComplexBloc, BlocComplexState>(
            listener: (context, state) {
              // if (state is BlocSampleAdded) {
              //   BlocProvider.of<BlocSampleBloc>(context)
              //       .add(GetEmployeesEvent());
              // }
            },
            // buildWhen: (previous, current) {
            //   if (previous is BlocSampleLoading) {
            //     return true;
            //   }
            //   return false;
            // },

            builder: (context, state) {
              if (state.getEmployeesStatus.state == BlocState.loading) {
                return const CircularProgressIndicator();
              }

              if (state.getEmployeesStatus.state == BlocState.loaded) {
                return Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text("نام:"),
                                            Text(state.getEmployeesStatus
                                                .employeeEntites[index].name)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("نام خانوادگی:"),
                                            Text(state.getEmployeesStatus
                                                .employeeEntites[index].family)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("سن:"),
                                            Text(state.getEmployeesStatus
                                                .employeeEntites[index].age
                                                .toString())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: state
                                .getEmployeesStatus.employeeEntites.length))
                  ],
                );
              }

              return Container();
            },
          )
          //)
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          serviceLocator<BlocComplexBloc>().add(const AddEmployeeComplexEvent(
              EmployeeEntity(name: "مسعود", family: "پارسا", age: 10)));
        },
      ),
    );
  }
}
