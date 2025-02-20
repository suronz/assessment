class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',|\n';
    if (numbers.startsWith("//")) {
      var parts = numbers.split("\n");
      delimiter = RegExp(RegExp.escape(parts[0].substring(2)));
      numbers = parts.sublist(1).join("\n");
    }

    List<int> parsedNumbers = numbers
        .split(RegExp(delimiter))
        .where((num) => num.isNotEmpty)
        .map(int.parse)
        .toList();

    List<int> negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    return parsedNumbers.fold(0, (sum, num) => sum + num);
  }
}