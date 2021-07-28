import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = new CounterCubit();

  void dispose() {
    _counterCubit.close();
  }

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: _counterCubit,
            child: MyHomePage(
              title: 'Flutter Counter via CUBIT',
            ),
          ),
        );
      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: 'Second Screen',
              color: Colors.cyan,
            ),
          ),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: 'Third Screen',
              color: Colors.indigoAccent,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
