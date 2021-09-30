import 'package:cli_badges/src/colors.dart';

class BadgeTheme {
  static final BadgeTheme primary = BadgeTheme();
  static final BadgeTheme green = BadgeTheme(messageBg: 'green');
  static final BadgeTheme red = BadgeTheme(messageBg: 'red');
  static final BadgeTheme yellow = BadgeTheme(messageBg: 'yellow');
  static final BadgeTheme blue = BadgeTheme(messageBg: 'blue');
  static final BadgeTheme magenta = BadgeTheme(messageBg: 'magenta');
  static final BadgeTheme cyan = BadgeTheme(messageBg: 'cyan');

  final Colors _colors = Colors();

  final String messageBg;
  final String messageColor;

  final String labelBg;
  final String labelColor;

  BadgeTheme({
    this.messageBg = 'blue',
    this.messageColor = 'backgroundWhite',
    this.labelBg = 'brightBlack',
    this.labelColor = 'white',
  });

  colorLabel(String label) {
    var labelWithBg = _colors.mappedBgColor(labelBg, label);
    return _colors.mappedColor(labelColor, labelWithBg);
  }

  colorMessage(String message) {
    var messageWithBg = _colors.mappedBgColor(messageBg, message);
    return _colors.mappedColor(messageColor, messageWithBg);
  }

  swapped() {
    return BadgeTheme(
      messageBg: labelBg,
      labelBg: messageBg,
      messageColor: labelColor,
      labelColor: messageColor,
    );
  }

  copyWith({
    String? messageBg,
    String? messageColor,
    String? labelBg,
    String? labelColor,
  }) {
    return BadgeTheme(
      messageBg: messageBg ?? this.messageBg,
      messageColor: messageColor ?? this.messageColor,
      labelBg: labelBg ?? this.labelBg,
      labelColor: labelColor ?? this.labelColor,
    );
  }
}
