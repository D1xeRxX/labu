import 'package:flutter/material.dart';
import 'function_calculator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double? _result;
  final FunctionCalculator _calculator = FunctionCalculator();

  void _incrementCounter() {
    setState(() {
      _counter++;
      _result = _calculator.calculate(_counter.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IPZ-31: Vakulenko Denys Flutter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Counter: $_counter',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text(
                'Function Result: $_result',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.mouse), // Іконка відповідно до варіанту
      ),
    );
  }
}
