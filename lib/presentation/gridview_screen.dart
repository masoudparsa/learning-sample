import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/core/constant/service_locator.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  void initState() {
    serviceLocator.get<BlocSampleBloc>().add(GetEmployeesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<BlocSampleBloc, BlocSampleState>(
        builder: (context, state) {
          if (state is BlocSampleLoadded) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: state.employeeEntites.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      String name = state.employeeEntites[index].name;
                      if (index == 2) {
                        name = state.employeeEntites[index].name +
                            " sdytd uysduyd udu yduydus dyuyd usdyudy udysud ud y y uuyu yuy uyu yuyuy u u y uyuy ui yiouuerieyrui  yeury er";
                      }
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(name),
                            SizedBox(
                              height: 5,
                            ),
                            Text("age")
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
