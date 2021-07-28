import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/constants/enums.dart';
import '../../business_logic/cubit/internet_cubit.dart';
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
            BlocBuilder<InternetCubit, InternetState>(builder: (_, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Column(
                  children: [
                    Icon(
                      Icons.wifi,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Text(
                      "WI-FI",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Column(
                  children: [
                    Icon(
                      Icons.lte_mobiledata,
                      color: Colors.green,
                      size: 40,
                    ),
                    Text(
                      "Mobile Data",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.green,
                      ),
                    ),
                  ],
                );
              } else if (state is InternetDisconnected) {
                return Column(
                  children: [
                    Icon(
                      Icons.signal_wifi_connected_no_internet_4_sharp,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text(
                      "Not Connected",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.red,
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
            Spacer(),
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
