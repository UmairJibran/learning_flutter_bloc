import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/presentation/screens/second_screen.dart';
import 'package:learning_flutter_bloc/presentation/screens/third_screen.dart';
import 'business_logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CounterCubit _counterCubit = new CounterCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/": (ctx) => BlocProvider.value(
              value: _counterCubit,
              child: MyHomePage(
                title: 'Flutter Counter via CUBIT',
              ),
            ),
        SecondScreen.routeName: (ctx) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                title: 'Second Screen',
                color: Colors.cyan,
              ),
            ),
        ThirdScreen.routeName: (ctx) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(
                title: 'Third Screen',
                color: Colors.indigoAccent,
              ),
            ),
      },
    );
  }
}
