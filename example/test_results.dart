import 'package:cli_badges/cli_badges.dart';

void main() {
  final failedBadge = Badge(label: 'failed', message: '2', theme: BadgeTheme.red);
  final successBadge = Badge(label: 'success', message: '2').green();
  final skippedBadge = Badge.yellow(label: 'skipped', message: '2');

  print(
    Badge.inline([failedBadge, skippedBadge, successBadge]),
  );
}
