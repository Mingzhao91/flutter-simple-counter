import 'package:flutter/material.dart';
import '../bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state is IncrementSate) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successfully Increased'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state is DecrementSate) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successfully Decreased'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    'Counter value: ${state.counterValue}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterDecrementEvent()),
                      icon: Icon(Icons.remove),
                      label: Text('Decrease'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .read<CounterBloc>()
                          .add(CounterIncrementEvent()),
                      icon: Icon(Icons.add),
                      label: Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
