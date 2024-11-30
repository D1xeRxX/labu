import 'package:flutter/material.dart';

class V0 extends StatefulWidget {
  const V0({super.key});

  @override
  State<V0> createState() => _V0State();
}

class _V0State extends State<V0> {
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Синій квадратний контейнер з налаштуваннями кутів
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_topLeft),
              topRight: Radius.circular(_topRight),
              bottomLeft: Radius.circular(_bottomLeft),
              bottomRight: Radius.circular(_bottomRight),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Налаштування радіусу для Top Left
        Row(
          children: [
            const Text("TL: "),
            Expanded(
              child: Slider(
                value: _topLeft,
                min: 0,
                max: 75,
                onChanged: (value) {
                  setState(() {
                    _topLeft = value;
                  });
                },
              ),
            ),
            Text(_topLeft.toStringAsFixed(2)),
          ],
        ),
        // Налаштування радіусу для Top Right
        Row(
          children: [
            const Text("TR: "),
            Expanded(
              child: Slider(
                value: _topRight,
                min: 0,
                max: 75,
                onChanged: (value) {
                  setState(() {
                    _topRight = value;
                  });
                },
              ),
            ),
            Text(_topRight.toStringAsFixed(2)),
          ],
        ),
        // Налаштування радіусу для Bottom Left
        Row(
          children: [
            const Text("BL: "),
            Expanded(
              child: Slider(
                value: _bottomLeft,
                min: 0,
                max: 75,
                onChanged: (value) {
                  setState(() {
                    _bottomLeft = value;
                  });
                },
              ),
            ),
            Text(_bottomLeft.toStringAsFixed(2)),
          ],
        ),
        // Налаштування радіусу для Bottom Right
        Row(
          children: [
            const Text("BR: "),
            Expanded(
              child: Slider(
                value: _bottomRight,
                min: 0,
                max: 75,
                onChanged: (value) {
                  setState(() {
                    _bottomRight = value;
                  });
                },
              ),
            ),
            Text(_bottomRight.toStringAsFixed(2)),
          ],
        ),
      ],
    );
  }
}
