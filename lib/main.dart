import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented!)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Counter incremented"),
                duration: Duration(milliseconds: 500),
              ),
            );
          else
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Counter decremented"),
                duration: Duration(milliseconds: 500),
              ),
            );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue == 0) {
                    return Text(
                      "Could it be nothing?",
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  if (state.counterValue < 0) {
                    return Text(
                      "🧐 " + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  if (state.counterValue % 5 == 0) {
                    return Text(
                      "Hmm, Multiple of 5!!",
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  return Text(
                    (state.counterValue % 2 == 0 ? "Even: " : "Odd: ") +
                        state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                children: [
                  Spacer(flex: 2),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
