import 'package:test/test.dart';
import 'string_calculator.dart';

/// Unit tests for the String Calculator.
void main() {
  final calculator = StringCalculator();

  test("Returns 0 for an empty string", () {
    expect(calculator.add(""), equals(0));
  });

  test("Returns the number itself for a single number", () {
    expect(calculator.add("1"), equals(1));
    expect(calculator.add("5"), equals(5));
  });

  test("Returns the sum of two numbers", () {
    expect(calculator.add("1,5"), equals(6));
    expect(calculator.add("2,3"), equals(5));
  });

  test("Handles multiple numbers", () {
    expect(calculator.add("1,2,3,4,5"), equals(15));
  });

  test("Handles new lines as delimiters", () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  test("Handles custom delimiters", () {
    expect(calculator.add("//;\n1;2"), equals(3));
    expect(calculator.add("//|\n2|3|4"), equals(9));
  });

  // Check negative numbers. 
  test("Throws exception for negative numbers", () {
    expect(() => calculator.add("1,-2,3"), throwsA(predicate((e) => e.toString().contains("negative numbers not allowed -2"))));
  });

  // Check multiple negative numbers.
  test("Throws exception for multiple negative numbers", () {
    expect(() => calculator.add("1,-2,-3,4"), throwsA(predicate((e) => e.toString().contains("negative numbers not allowed -2,-3"))));
  });
}