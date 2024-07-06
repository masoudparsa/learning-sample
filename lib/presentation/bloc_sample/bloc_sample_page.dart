import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/core/constant/service_locator.dart';
import 'package:flutter_application_new_card/domain/enities/employee_entity.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSamplePage extends StatefulWidget {
  const BlocSamplePage({super.key});

  @override
  State<BlocSamplePage> createState() => _BlocSamplePageState();
}

class _BlocSamplePageState extends State<BlocSamplePage> {
  @override
  void initState() {
    serviceLocator.get<BlocSampleBloc>().add(GetEmployeesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("BlocSample"),
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

              BlocConsumer<BlocSampleBloc, BlocSampleState>(
            listener: (context, state) {
              if (state is BlocSampleAdded) {
                BlocProvider.of<BlocSampleBloc>(context)
                    .add(GetEmployeesEvent());
              }
            },
            // buildWhen: (previous, current) {
            //   if (previous is BlocSampleLoading) {
            //     return true;
            //   }
            //   return false;
            // },

            builder: (context, state) {
              if (state is BlocSampleLoading) {
                return const CircularProgressIndicator();
              }

              if (state is BlocSampleLoadded) {
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
                                            Text(state
                                                .employeeEntites[index].name)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("نام خانوادگی:"),
                                            Text(state
                                                .employeeEntites[index].family)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("سن:"),
                                            Text(state
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
                            itemCount: state.employeeEntites.length))
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
          serviceLocator<BlocSampleBloc>().add(const AddEmployeeEvent(
              EmployeeEntity(name: "مسعود", family: "پارسا", age: 10)));
        },
      ),
    );
  }
}
