import 'package:cli_badges/src/colorer.dart';

/// Class to hold the theme configuration for [Badge]
///
/// It also provide a list of premade themes:
/// * BadgeTheme.primary
/// * BadgeTheme.green
/// * BadgeTheme.red
/// * BadgeTheme.yellow
/// * BadgeTheme.blue
/// * BadgeTheme.magenta
/// * BadgeTheme.cyan
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

  late IColorer colorer;

  /// Background color name for the badge's message (E.g: red, black, green, blue, cyan, etc...)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final String messageBg;

  /// Foreground color name for the badge's message (E.g: red, black, green, blue, cyan, etc...)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final String messageColor;

  /// Background color code for the badge's message (i.e. an int ranging from 0 to 255)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final int? messageBgCode;

  /// Foreground color code for the badge's message (i.e. an int ranging from 0 to 255)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final int? messageColorCode;

  /// Background color name for the badge's label (E.g: red, black, green, blue, cyan, etc...)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final String labelBg;

  /// Foreground color name for the badge's label (E.g: red, black, green, blue, cyan, etc...)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final String labelColor;

  /// Background color code for the badge's label (i.e. an int ranging from 0 to 255)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final int? labelBgCode;

  /// Foreground color code for the badge's label (i.e. an int ranging from 0 to 255)
  ///
  /// For a complete list of colors check [the docs](https://github.com/nombrekeff/cli_badges_dart#colors)
  final int? labelColorCode;

  BadgeTheme({
    this.messageBg = 'blue',
    this.messageColor = 'white',
    this.labelBg = 'brightBlack',
    this.labelColor = 'white',
    this.messageBgCode,
    this.messageColorCode,
    this.labelBgCode,
    this.labelColorCode,
    IColorer? colorer,
  }) {
    this.colorer = colorer ?? DefaultColorer();
  }

  /// Returns the colored representation of the badge's label
  String colorLabel(String label) {
    final labelWithBg = labelBgCode == null
        ? colorer.backgroundFromName(labelBg, label)
        : colorer.colorFromCode(labelBgCode!, label);

    return labelColorCode == null
        ? colorer.colorFromName(labelColor, labelWithBg)
        : colorer.colorFromCode(labelColorCode!, labelWithBg);
  }

  /// Returns the colored representation of the badge's message
  String colorMessage(String message) {
    final messageWithBg = messageBgCode == null
        ? colorer.backgroundFromName(messageBg, message)
        : colorer.colorFromCode(messageBgCode!, message);

    return messageColorCode == null
        ? colorer.colorFromName(messageColor, messageWithBg)
        : colorer.colorFromCode(messageColorCode!, messageWithBg);
  }

  /// Swaps message and label styles. The color from the label will be swapped with the color from the message, and vice versa.
  BadgeTheme swapped() {
    return BadgeTheme(
      messageBg: labelBg,
      labelBg: messageBg,
      messageColor: labelColor,
      labelColor: messageColor,
    );
  }

  /// Creates a copy of this badge theme but with the given fields replaced with
  /// the new values.
  BadgeTheme copyWith({
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
