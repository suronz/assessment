import 'dart:io';
import 'string_calculator.dart';

/// Main function to interact with the user and use the String Calculator.
void main() {
  final calculator = StringCalculator();

  while (true) {
    stdout.write("\nEnter numbers (or type 'exit' to quit): ");
    String input = stdin.readLineSync() ?? "";

    // Exit condition
    if (input.toLowerCase() == "exit") {
      print("Goodbye!");
      break;
    }

    try {
      int result = calculator.add(input);
      print("Result: $result");
    } catch (e) {
      // Handle error.
      print("Error: ${e.toString()}");
    }
  }
}