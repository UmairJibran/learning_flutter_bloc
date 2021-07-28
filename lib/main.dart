import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/internet_cubit.dart';
import 'presentation/router/app_router.dart';
import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({
    Key? key,
    required this.connectivity,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext counterCubitContext) => CounterCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (BuildContext internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }
}
