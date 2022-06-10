import 'package:ansicolor/ansicolor.dart';

const Map<String, int> _colorMap = {
  'black': 0,
  'red': 1,
  'green': 2,
  'yellow': 3,
  'blue': 4,
  'magenta': 5,
  'cyan': 6,
  'white': 7,
  'brightBlack': 8,
  'brightRed': 9,
  'brightGreen': 10,
  'brightYellow': 11,
  'brightBlue': 12,
  'brightMagenta': 13,
  'brightCyan': 14,
  'brightWhite': 15,
};

class BadgeTheme {
  static final BadgeTheme primary = BadgeTheme();
  static final BadgeTheme green = BadgeTheme(
    messageBg: 'green',
    messageColor: 'black',
  );
  static final BadgeTheme red = BadgeTheme(
    messageBg: 'red',
    messageColor: 'white',
  );
  static final BadgeTheme yellow = BadgeTheme(
    messageBg: 'yellow',
    messageColor: 'black',
  );
  static final BadgeTheme blue = BadgeTheme(messageBg: 'blue');
  static final BadgeTheme magenta = BadgeTheme(messageBg: 'magenta');
  static final BadgeTheme cyan = BadgeTheme(messageBg: 'cyan');

  // Alias
  static final BadgeTheme success = green;
  static final BadgeTheme error = red;
  static final BadgeTheme warning = yellow;
  static final BadgeTheme info = blue;

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
    this.messageColor = 'white',
    this.labelBg = 'brightBlack',
    this.labelColor = 'white',
    this.messageBgCode,
    this.messageColorCode,
    this.labelBgCode,
    this.labelColorCode,
  });

  _colorSegment(int fg, int bg, String text) {
    final pen = AnsiPen()
      ..xterm(fg)
      ..xterm(bg, bg: true);

    return pen(text);
  }

  colorLabel(String label) {
    final fg = labelColorCode ?? _colorMap[labelColor] ?? 15; // default white
    final bg = labelBgCode ?? _colorMap[labelBg] ?? 0; // default black

    return _colorSegment(fg, bg, label);
  }

  colorMessage(String message) {
    final fg = messageColorCode ?? _colorMap[messageColor] ?? 15; // default white
    final bg = messageBgCode ?? _colorMap[messageBg] ?? 0; // default black

    return _colorSegment(fg, bg, message);
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
