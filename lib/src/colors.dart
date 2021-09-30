String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class Colors {
  // * 8bits colors
  static const String black = '\u001b[30m';
  static const String red = '\u001b[31m';
  static const String green = '\u001b[32m';
  static const String yellow = '\u001b[33m';
  static const String blue = '\u001b[34m';
  static const String magenta = '\u001b[35m';
  static const String cyan = '\u001b[36m';
  static const String white = '\u001b[37m';
  static const String reset = '\u001b[0m';

  // * 16bits colors
  static const String brightBlack = '\u001b[30;1m';
  static const String brightRed = '\u001b[31;1m';
  static const String brightGreen = '\u001b[32;1m';
  static const String brightYellow = '\u001b[33;1m';
  static const String brightBlue = '\u001b[34;1m';
  static const String brightMagenta = '\u001b[35;1m';
  static const String brightCyan = '\u001b[36;1m';
  static const String brightWhite = '\u001b[37;1m';

  // * backgroud color
  static const String backgroundBlack = '\u001b[40m';
  static const String backgroundRed = '\u001b[41m';
  static const String backgroundGreen = '\u001b[42m';
  static const String backgroundYellow = '\u001b[43m';
  static const String backgroundBlue = '\u001b[44m';
  static const String backgroundMagenta = '\u001b[45m';
  static const String backgroundCyan = '\u001b[46m';
  static const String backgroundWhite = '\u001b[47m';

  // * backgroud Bright color
  static const String backgroundBrightBlack = '\u001b[40;1m';
  static const String backgroundBrightRed = '\u001b[41;1m';
  static const String backgroundBrightGreen = '\u001b[42;1m';
  static const String backgroundBrightYellow = '\u001b[43;1m';
  static const String backgroundBrightBlue = '\u001b[44;1m';
  static const String backgroundBrightMagenta = '\u001b[45;1m';
  static const String backgroundBrightCyan = '\u001b[46;1m';
  static const String backgroundBrightWhite = '\u001b[47;1m';

  // * decorations
  static const String bold = '\u001b[1m';
  static const String underline = '\u001b[4m';
  static const String reversed = '\u001b[7m';

  static const Map<String, String> _colorMap = {
    'red': red,
    'black': black,
    'green': green,
    'yellow': yellow,
    'blue': blue,
    'magenta': magenta,
    'cyan': cyan,
    'white': white,
    'brightRed': brightRed,
    'brightBlack': brightBlack,
    'brightGreen': brightGreen,
    'brightYellow': brightYellow,
    'brightBlue': brightBlue,
    'brightMagenta': brightMagenta,
    'brightCyan': brightCyan,
    'brightWhite': brightWhite,
    'backgroundBlack': backgroundBlack,
    'backgroundRed': backgroundRed,
    'backgroundGreen': backgroundGreen,
    'backgroundYellow': backgroundYellow,
    'backgroundBlue': backgroundBlue,
    'backgroundMagenta': backgroundMagenta,
    'backgroundCyan': backgroundCyan,
    'backgroundWhite': backgroundWhite,
    'backgroundBrightBlack': backgroundBrightBlack,
    'backgroundBrightRed': backgroundBrightRed,
    'backgroundBrightGreen': backgroundBrightGreen,
    'backgroundBrightYellow': backgroundBrightYellow,
    'backgroundBrightBlue': backgroundBrightBlue,
    'backgroundBrightMagenta': backgroundBrightMagenta,
    'backgroundBrightCyan': backgroundBrightCyan,
    'backgroundBrightWhite': backgroundBrightWhite,
    'bold': bold,
    'underline': underline,
    'reversed': reversed,
  };

  static bool isValidColor(String? colorName) {
    return _colorMap.containsKey(colorName);
  }

  String color(String? color, String text) {
    return '$color$text$reset';
  }

  String mappedColor(String colorName, String text) {
    if (!isValidColor(colorName)) {
      throw Exception('Color "$colorName" not found');
    }

    var colorer = _colorMap[colorName];

    return color(colorer, text);
  }

  String mappedBgColor(String colorName, String text) {
    var bgColorName = 'background${capitalize(colorName)}';

    return mappedColor(bgColorName, text);
  }

  String color256(String text, int code) {
    var isValidAnsiColor = code < 0 || code > 255;

    return isValidAnsiColor ? '\u001b[38;5;${code}m$text$reset' : text;
  }
}
