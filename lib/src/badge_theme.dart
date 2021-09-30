import 'package:cli_badges/src/colors.dart';

class BadgeTheme {
  static final BadgeTheme primary = BadgeTheme();
  static final BadgeTheme green = BadgeTheme(
    messageBg: 'green',
    messageColor: 'black',
  );
  static final BadgeTheme red = BadgeTheme(messageBg: 'red');
  static final BadgeTheme yellow = BadgeTheme(
    messageBg: 'yellow',
    messageColor: 'black',
  );
  static final BadgeTheme blue = BadgeTheme(messageBg: 'blue');
  static final BadgeTheme magenta = BadgeTheme(messageBg: 'magenta');
  static final BadgeTheme cyan = BadgeTheme(messageBg: 'cyan');

  final Colors _colors = Colors();

  final String messageBg;
  final String messageColor;

  final int? messageBgCode;
  final int? messageColorCode;

  final String labelBg;
  final String labelColor;

  final int? labelBgCode;
  final int? labelColorCode;

  BadgeTheme({
    this.messageBg = 'blue',
    this.messageColor = 'backgroundWhite',
    this.labelBg = 'brightBlack',
    this.labelColor = 'white',
    this.messageBgCode,
    this.messageColorCode,
    this.labelBgCode,
    this.labelColorCode,
  });

  colorLabel(String label) {
    var labelWithBg = labelBgCode == null
        ? _colors.mappedBgColor(labelBg, label)
        : _colors.color256(labelBgCode!, label);

    return labelColorCode == null
        ? _colors.mappedColor(labelColor, labelWithBg)
        : _colors.color256(labelColorCode!, labelWithBg);
  }

  colorMessage(String message) {
    var messageWithBg = messageBgCode == null
        ? _colors.mappedBgColor(messageBg, message)
        : _colors.color256(messageBgCode!, message);

    return messageColorCode == null
        ? _colors.mappedColor(messageColor, messageWithBg)
        : _colors.color256(messageColorCode!, messageWithBg);
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
