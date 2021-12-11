class Command {
  Command({required this.direction, required this.distance});

  late Direction direction;
  late int distance;
}

enum Direction { forward, down, up }
