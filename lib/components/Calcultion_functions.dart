import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class CalculationFunction
{

  // function for calculating mean
  static double calculateMean(List<double> numbers) {
    if (numbers.isEmpty) {
      return 0.0; // Return 0 if the list is empty to avoid division by zero.
    }

    double sum = 0.0;

    for (var number in numbers) {
      sum += number;
    }

    return sum / numbers.length;
  }

  static double calculateStandardDeviation(List<double> numbers) {
    if (numbers.isEmpty || numbers.length < 2) {
      return 0.0; // Return 0 for empty or single-value lists.
    }

    double sum = 0.0;
    double mean = calculateMean(numbers);

    for (var number in numbers) {
      sum += (number - mean) * (number - mean);
    }

    double variance = sum / (numbers.length - 1);
    return sqrt(variance);
  }
  //function for calculating mode
  static List<double> calculateMode(List<double> numbers) {
    if (numbers.isEmpty) {
      return [];
    }

    Map<double, int> frequencyMap = {};

    for (var number in numbers) {
      frequencyMap[number] = (frequencyMap[number] ?? 0) + 1;
    }

    int maxFrequency = frequencyMap.values.reduce((a, b) => a > b ? a : b);

    List<double> mode = [];

    for (var entry in frequencyMap.entries) {
      if (entry.value == maxFrequency) {
        mode.add(entry.key);
      }
    }

    return mode;
  }
  //function for calculating median
  static double calculateMedian(List<double> numbers) {
    if (numbers.isEmpty) {
      return 0.0; // Return 0 if the list is empty.
    }

    numbers.sort();
    int middle = numbers.length ~/ 2;

    if (numbers.length % 2 == 0) {
      return (numbers[middle - 1] + numbers[middle]) / 2;
    } else {
      return numbers[middle].toDouble();
    }
  }


  //calculating frequency
  static Map<T, int> calculateFrequency<T>(List<T> list) {
    Map<T, int> frequencyMap = {};

    for (T item in list) {
      if (frequencyMap.containsKey(item)) {
        frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
      } else {
        frequencyMap[item] = 1;
      }
    }

    return frequencyMap;
  }


}