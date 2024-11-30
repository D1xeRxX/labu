import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 50.0;
const _bgColor = Colors.green;
const _borderColor = Colors.grey;
const _borderWidth = 3.0;
const _borderRadius = 8.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildTwo(),
      ),
    );
  }

  List<Widget> _buildTwo() {
    return [
      _buildLineTop(),          // Верхня лінія
      _buildLineRight1(),       // Діагональ праворуч
      _buildLineRight2(),       // Ще одна діагональ
      _buildLineRight3(),       // Остання діагональ
      _buildLineBottom(),       // Нижня лінія
    ];
  }

  Widget _buildLineTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  Widget _buildLineRight1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmpty(),
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _buildLineRight2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmpty(),
        _buildDot(),
        _buildEmpty(),
      ],
    );
  }

  Widget _buildLineRight3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildEmpty(),
        _buildEmpty(),
      ],
    );
  }

  Widget _buildLineBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}