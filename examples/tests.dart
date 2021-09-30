import 'package:cli_badges/cli_badges.dart';

void main() {
  print(
    Badge.inline([
      Badge(
        label: 'test',
        message: 'badge',
      ),
      Badge(
        label: 'test',
        message: 'badge',
        theme: BadgeTheme(
          messageBg: 'green',
          labelBgCode: 43,
          labelColorCode: 31,
        ),
      ),
      Badge(
        label: 'test',
        message: 'badge',
      ).red(),
      Badge(
        label: 'test',
        message: 'badge',
      ).cyan().swapped(),
    ]),
  );
}
