import 'dart:math';

class Diagnostics {
  Diagnostics(List<String> codes) {
    this.codes = codes;
    positiveCounts = _getPositiveCounts(codes);
  }

  late List<String> codes;
  late List<int> positiveCounts;

  int get gamma {
    final halfValue = codes.length / 2.0;
    List<int> gammaBinary = List.filled(positiveCounts.length, 0);
    for (int i = 0; i < positiveCounts.length; i++) {
      if (positiveCounts[i] > halfValue) {
        gammaBinary[i] = 1;
      } else {
        gammaBinary[i] = 0;
      }
    }

    return _countBinary(gammaBinary);
  }

  int get epsilon {
    final halfValue = codes.length / 2.0;
    List<int> epsilonBinary = List.filled(positiveCounts.length, 0);
    for (int i = 0; i < positiveCounts.length; i++) {
      if (positiveCounts[i] < halfValue) {
        epsilonBinary[i] = 1;
      } else {
        epsilonBinary[i] = 0;
      }
    }

    return _countBinary(epsilonBinary);
  }

  int get oxygenGeneratorRating {
    var filteredList = codes;
    var counts = positiveCounts;
    var index = 0;
    while (filteredList.length > 1) {
      filteredList = filteredList
          .where((element) =>
              element[index] ==
              (counts[index] >= (filteredList.length / 2.0) ? '1' : '0'))
          .toList();
      if (filteredList.length == 1) {
        final binaryValue = filteredList.first
            .split('')
            .map((char) => int.parse(char))
            .toList();
        return _countBinary(binaryValue);
      } else {
        counts = _getPositiveCounts(filteredList);
        index++;
      }
    }

    return 0;
  }

  int get co2ScrubberRating {
    var filteredList = codes;
    var counts = positiveCounts;
    var index = 0;
    while (filteredList.length > 1) {
      filteredList = filteredList
          .where((element) =>
              element[index] ==
              (counts[index] < (filteredList.length / 2.0) ? '1' : '0'))
          .toList();
      if (filteredList.length == 1) {
        final binaryValue = filteredList.first
            .split('')
            .map((char) => int.parse(char))
            .toList();
        return _countBinary(binaryValue);
      } else {
        counts = _getPositiveCounts(filteredList);
        index++;
      }
    }

    return 0;
  }

  List<int> _getPositiveCounts(List<String> codes) {
    final posCounts = List.filled(codes[0].length, 0);
    for (final code in codes) {
      for (int bitIndex = 0; bitIndex < code.length; bitIndex++) {
        if (code[bitIndex] == '1') {
          posCounts[bitIndex]++;
        }
      }
    }

    return posCounts;
  }

  int _countBinary(List<int> binary) {
    var total = 0;
    for (int i = 0; i < binary.length; i++) {
      if (binary[i] == 1) {
        total += pow(2, binary.length - i - 1) as int;
      }
    }

    return total;
  }
}
