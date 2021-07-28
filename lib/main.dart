import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/router/app_router.dart';
import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = new AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}
