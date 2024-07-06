import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/core/constant/service_locator.dart';

import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverScreen2 extends StatefulWidget {
  const SliverScreen2({super.key});

  @override
  State<SliverScreen2> createState() => _SliverScreen2State();
}

class _SliverScreen2State extends State<SliverScreen2> {
  @override
  void initState() {
    serviceLocator.get<BlocSampleBloc>().add(GetEmployeesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.amber,
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Sliver"),
                titlePadding: const EdgeInsets.only(bottom: 50),
                centerTitle: true,
                background: Image.asset(
                  "assets/images/images.png",
                  fit: BoxFit.cover,
                ),
              ),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Person",
                ),
                Tab(
                  text: "Admin",
                )
              ]),
            ),
            BlocBuilder<BlocSampleBloc, BlocSampleState>(
              builder: (context, state) {
                if (state is BlocSampleLoading) {
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is BlocSampleLoadded) {
                  return SliverList.separated(
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("نام:"),
                                        Text(state.employeeEntites[index].name)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("نام خانوادگی:"),
                                        Text(
                                            state.employeeEntites[index].family)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("سن:"),
                                        Text(state.employeeEntites[index].age
                                            .toString())
                                      ],
                                    )
                                  ],
                                ),
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
                      itemCount: state.employeeEntites.length);
                }
                return SliverToBoxAdapter(
                  child: Container(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
