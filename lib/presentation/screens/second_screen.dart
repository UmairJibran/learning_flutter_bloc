import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = "/second-screen";

  SecondScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
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
                  backgroundColor: widget.color,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  backgroundColor: widget.color,
                ),
                Spacer(flex: 2),
              ],
            ),
            Spacer(),
            TextButton(
              child: Text(
                "Navigate to Home Screen",
                style: TextStyle(
                  color: widget.color,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
