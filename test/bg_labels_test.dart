import 'package:cli_badges/src/badge.dart';
import 'package:cli_badges/src/badge_theme.dart';
import 'package:test/test.dart';

import 'badge_test_data.dart';

typedef TesterFn = dynamic Function();

TesterFn testLabelBg(color, expected) {
  return () {
    final testBadge = Badge(label: 'lbl', message: 'msg', theme: BadgeTheme(labelBg: color));
    expect(testBadge.toString(), expected);
  };
}

void main() {
  final bgLabelsData = badgesTestData['bgLabels'];

  for (final lblData in bgLabelsData) {
    test('Bg label [${lblData['color']}]', testLabelBg(lblData['color'], lblData['badge']));
  }
}
