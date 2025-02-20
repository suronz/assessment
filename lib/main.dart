import 'dart:io';
import 'string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  print("Welcome to String Calculator!");
  print("Enter a string of numbers (comma-separated or with new lines).");
  print("To use a custom delimiter, start with //[delimiter]\\n before numbers.");
  print("Example: //;\\n1;2 (delimiter ';'), or just '1,2,3'");

  while (true) {
    stdout.write("\nEnter numbers (or type 'exit' to quit): ");
    String input = stdin.readLineSync() ?? "";

    if (input.toLowerCase() == "exit") {
      print("Goodbye!");
      break;
    }

    try {
      int result = calculator.add(input);
      print("Result: $result");
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}