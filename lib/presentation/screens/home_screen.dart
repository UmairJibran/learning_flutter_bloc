import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/counter_cubit.dart';
import 'second_screen.dart';
import 'third_screen.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
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
            Spacer(),
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
            Spacer(),
            TextButton(
              child: Text("Navigate to Second Screen"),
              onPressed: () {
                Navigator.pushNamed(context, SecondScreen.routeName);
              },
            ),
            TextButton(
              child: Text("Navigate to Third Screen"),
              onPressed: () {
                Navigator.pushNamed(context, ThirdScreen.routeName);
              },
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
