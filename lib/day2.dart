import 'dart:io';

import 'commands.dart';
import 'input_handler.dart';

void main(List<String> args) async {
  final handler = InputHandler(File('lib/inputs/day2.txt'));
  final commands = Commands(await handler.getCommands());
  final commandsAim = Commands(await handler.getCommands(), aimMode: true);

  print(commands.getDepth() * commands.getDistance());
  print(commandsAim.getDepth() * commandsAim.getDistance());
}
