import 'package:cli_badges/cli_badges.dart';

void main() {
  print(
    Badge(label: 'test', message: 'badge'),
  );
  print(
    Badge(
      label: 'test',
      message: 'badge',
      theme: BadgeTheme(messageBg: 'green'),
    ),
  );
  print(
    Badge(
      label: 'test',
      message: 'badge',
    ).red(),
  );
  print(
    Badge(
      label: 'test',
      message: 'badge',
    ).red().swapped(),
  );
}
