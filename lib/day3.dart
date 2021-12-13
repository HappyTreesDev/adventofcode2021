import 'dart:io';

import 'input_handler.dart';

void main(List<String> args) async {
  final handler = InputHandler(File('lib/inputs/day3.txt'));
  final diagnostics = await handler.getDiagnostics();
  print(diagnostics.gamma * diagnostics.epsilon);
  print(diagnostics.co2ScrubberRating * diagnostics.oxygenGeneratorRating);
}
