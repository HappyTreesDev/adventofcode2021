import 'dart:io';

import 'command.dart';
import 'diagnostics.dart';

class InputHandler {
  InputHandler(this.input);

  late File input;

  Future<List<Command>> getCommands() async {
    final lines = await read();
    final List<Command> commands = [];
    for (var line in lines) {
      final parts = line.split(' ');
      switch (parts.first.toLowerCase()) {
        case 'forward':
          commands.add(Command(
              direction: Direction.forward, distance: int.parse(parts.last)));
          break;
        case 'up':
          commands.add(Command(
              direction: Direction.up, distance: int.parse(parts.last)));
          break;
        case 'down':
          commands.add(Command(
              direction: Direction.down, distance: int.parse(parts.last)));
          break;
      }
    }

    return commands;
  }

  Future<Diagnostics> getDiagnostics() async {}

  Future<List<String>> read() async {
    return await input.readAsLines();
  }
}
