import 'package:flutter/material.dart';
import 'presentation/router/app_router.dart';
import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterCubit _counterCubit = new CounterCubit();
  AppRouter _appRouter = new AppRouter();

  @override
  void dispose() {
    _counterCubit.close();
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }
}
