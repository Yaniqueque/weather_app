import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override

  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}