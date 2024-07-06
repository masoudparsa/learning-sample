import 'package:flutter_application_new_card/presentation/bloc_complex/bloc/bloc_complex_bloc.dart';
import 'package:flutter_application_new_card/presentation/bloc_sample/bloc/bloc_sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    //print('onChange -- ${bloc.runtimeType}');
    if (bloc is BlocComplexBloc) {
      print(bloc.state.getEmployeesStatus.state.toString());
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print('onCreate -- ${bloc.runtimeType}');
    if (bloc is BlocSampleBloc) {
      showToast("error bloc sample" + error.toString());
    }
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
  }
}
