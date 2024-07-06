import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/core/constant/consts.dart';
import 'package:flutter_application_new_card/core/constant/service_locator.dart';
import 'package:flutter_application_new_card/core/my_bloc_observer.dart';
import 'package:flutter_application_new_card/domain/enities/bank_card.dart';
import 'package:flutter_application_new_card/domain/usecases/get_employees_usecase.dart';
import 'package:flutter_application_new_card/presentation/bank_card/screens/new_card_screen.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/bloc_complex_bloc.dart';
import 'package:flutter_application_new_card/presentation/bloc_complex/bloc_complex_page.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc_sample_page.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/getx/employee_getx_controller.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/getx/employee_getx_controller_2.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/screens/getx_sample_page.dart';
import 'package:flutter_application_new_card/presentation/getx_sample/screens/getx_sample_page_2.dart';
import 'package:flutter_application_new_card/presentation/gridview_screen.dart';
import 'package:flutter_application_new_card/presentation/isolate_screen.dart';
import 'package:flutter_application_new_card/presentation/sliver_screen.dart';
import 'package:flutter_application_new_card/presentation/sliver_screen_2.dart';
import 'package:flutter_application_new_card/presentation/stack_widget.dart';
import 'package:flutter_application_new_card/presentation/widgets/card_with_header.dart';
import 'package:flutter_application_new_card/visibility_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:extension_package/extension_package.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ServiceLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeGetXConroller(serviceLocator.get<GetEmployeesUsecase>()));
    Get.put(EmployeeGetXConroller2(serviceLocator.get<GetEmployeesUsecase>()));
    return OKToast(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<BlocSampleBloc>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator<BlocComplexBloc>(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
                const StateManagmentSample() //const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
      ),
    );
  }
}

class StateManagmentSample extends StatefulWidget {
  const StateManagmentSample({super.key});

  @override
  State<StateManagmentSample> createState() => _StateManagmentSampleState();
}

class _StateManagmentSampleState extends State<StateManagmentSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("State Management Sample"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              CardWithHeaderWidget(
                  title: "GetX",
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const GetxSampleScreen();
                              },
                            ));
                          },
                          child: const Text("Gex Page")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const GetxSampleScreen2();
                              },
                            ));
                          },
                          child: const Text("Gex Page status"))
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              CardWithHeaderWidget(
                  title: "Bloc",
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const BlocSamplePage();
                              },
                            ));
                          },
                          child: const Text("Bloc Page")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const BlocComplexPage();
                              },
                            ));
                          },
                          child: const Text("Bloc Complex Page")),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              CardWithHeaderWidget(
                title: "Isolate",
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const IsolateScreen();
                        },
                      ));
                    },
                    child: const Text("Isolate test")),
              ),
              const SizedBox(
                height: 20,
              ),
              CardWithHeaderWidget(
                title: "Modals",
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // showAboutDialog(
                          //     context: context,
                          //     applicationName: "Dotin",
                          //     applicationVersion: "1.0.0");

                          // showTimePicker(
                          //     context: context, initialTie: TimeOfDay.now());

                          showDatePicker(
                              initialDatePickerMode: DatePickerMode.day,
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now());

                          // showDateRangePicker(
                          //     context: context,
                          //     firstDate: DateTime.now(),
                          //     lastDate: DateTime.now());
                        },
                        child: const Text("about")),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            builder: (context) {
                              return Container(
                                color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      color: Colors.blueAccent,
                                      height: 150,
                                      width: 150,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text("ok")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("cancel"))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("bottom sheet")),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Center(
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("dialog")),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardWithHeaderWidget(
                title: "visibility",
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const VisibilityScreen();
                        },
                      ));
                    },
                    child: const Text("visibility")),
              ),
              CardWithHeaderWidget(
                title: "gridview",
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const GridViewScreen();
                        },
                      ));
                    },
                    child: const Text("gridview")),
              ),
              CardWithHeaderWidget(
                title: "Sliver Screen",
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SliverScreen();
                            },
                          ));
                        },
                        child: const Text("Sliver Screen")),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SliverScreen2();
                            },
                          ));
                        },
                        child: const Text("Sliver Screen 2")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    bankCardEntities.add(BankCardEntity(
        cardName: "تست",
        cardNumber: "2523-2541-2365-1452",
        expireDate: "05/01"));
    bankCardEntities.add(BankCardEntity(
        cardName: "2تست",
        cardNumber: "2523-2541-2365-1452",
        expireDate: "05/01"));
    bankCardEntities.add(BankCardEntity(
        cardName: "3تست",
        cardNumber: "2523-2541-2365-1452",
        expireDate: "05/01"));
    bankCardEntities.add(BankCardEntity(
        cardName: "4تست",
        cardNumber: "2523-2541-2365-1452",
        expireDate: "05/01"));
    super.initState();
  }

  void _incrementCounter() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return StackWidget();
      },
    ));
    // var entity = await Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return NewCardScreen();
    //   },
    // ));
    // setState(() {});
    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueAccent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: bankCardEntities.length,
                  itemBuilder: (context, index) {
                    return getCardListView(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getCardListView(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("شماره کارت:",
                    style: TextStyle(fontFamily: "IRANSans")),
                const SizedBox(
                  width: 8,
                ),
                Text(bankCardEntities[index].cardNumber)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("تاریخ انقضا:",
                    style: TextStyle(fontFamily: "IRANSans")),
                const SizedBox(
                  width: 8,
                ),
                Text(bankCardEntities[index].expireDate,
                    style: TextStyle(fontFamily: "IRANSans"))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("نام کارت:",
                    style: TextStyle(fontFamily: "IRANSans")),
                const SizedBox(
                  width: 8,
                ),
                Text(bankCardEntities[index].cardName,
                    style: TextStyle(fontFamily: "IRANSans"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
