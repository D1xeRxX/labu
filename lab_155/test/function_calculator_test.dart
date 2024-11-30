import 'package:flutter_test/flutter_test.dart';
import 'package:lab_155/function_calculator.dart';

void main() {
  test('FunctionCalculator should return correct result for valid x', () {
    final calculator = FunctionCalculator();

    expect(calculator.calculate(1), equals(12));  // y = (1 + 3) * (4 - 1) = 12
    expect(calculator.calculate(2), equals(10)); // y = (2 + 3) * (4 - 2) = 10
  });

  test('FunctionCalculator should return correct result for x = -1', () {
    final calculator = FunctionCalculator();

    expect(calculator.calculate(-1), equals(20)); // y = (-1 + 3) * (4 - (-1)) = 20
  });
}
