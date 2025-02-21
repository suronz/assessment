class StringCalculator {
  /// Adds numbers provided in a comma-separated string.
  /// Supports new lines as delimiters and custom delimiters (e.g., "//;\n1;2").
  /// Throws an exception if negative numbers are included.  
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Default delimiters: comma (",") and newline ("\n")
    String delimiter = ',|\n';

    // Check if a custom delimiter is provided
    if (numbers.startsWith("//")) {
      var parts = numbers.split("\n");
      delimiter = RegExp(RegExp.escape(parts[0].substring(2)));
      numbers = parts.sublist(1).join("\n");
    }

    // Parse the numbers from the string using the specified delimiter(s)
    List<int> parsedNumbers = numbers
        .split(RegExp(delimiter))
        .where((num) => num.isNotEmpty)
        .map(int.parse)
        .toList();

    // Check for negative numbers
    List<int> negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    // Return the sum of the numbers
    return parsedNumbers.fold(0, (sum, num) => sum + num);
  }
}