import 'command.dart';

class Commands {
  Commands(this.commands, {this.aimMode = false});

  late List<Command> commands;
  late bool aimMode;

  int getDepth() {
    var depth = 0;
    var aim = 0;
    for (final command in commands) {
      if (command.direction == Direction.up) {
        if (aimMode) {
          aim -= command.distance;
        } else {
          depth -= command.distance;
        }
      } else if (command.direction == Direction.down) {
        if (aimMode) {
          aim += command.distance;
        } else {
          depth += command.distance;
        }
      } else if (command.direction == Direction.forward && aimMode) {
        depth += command.distance * aim;
      }
    }

    return depth;
  }

  int getDistance() {
    var distance = 0;
    for (final command in commands) {
      if (command.direction == Direction.forward) {
        distance += command.distance;
      }
    }

    return distance;
  }
}
