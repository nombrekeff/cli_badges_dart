import 'package:cli_badges/cli_badges.dart';

void main() {
  var failedBadge = Badge(label: 'failed', message: '2', theme: BadgeTheme.red);
  var successBadge = Badge(label: 'success', message: '2').green();
  var skippedBadge = Badge.yellow(label: 'skipped', message: '2');

  print(
    Badge.inline([failedBadge, skippedBadge, successBadge]),
  );
}
