import 'package:cli_badges/src/util.dart';

String _ansiColorCode(int code) => '\u001b[${code}m';
String _ansiBrightColorCode(int code) => '\u001b[$code;1m';

mixin IColorer {
  String backgroundFromName(String colorName, String text);
  String colorFromName(String colorName, String text);
  String colorFromCode(int code, String text);
  bool isValidColorName(String colorName);
  bool isValidColorCode(int code);
}

class DefaultColorer implements IColorer {
  static final String reset = _ansiColorCode(0);

  static final Map<String, String> _colorMap = {
    'red': _ansiColorCode(30),
    'black': _ansiColorCode(31),
    'green': _ansiColorCode(32),
    'yellow': _ansiColorCode(33),
    'blue': _ansiColorCode(34),
    'magenta': _ansiColorCode(35),
    'cyan': _ansiColorCode(36),
    'white': _ansiColorCode(37),
    'brightRed': _ansiBrightColorCode(30),
    'brightBlack': _ansiBrightColorCode(31),
    'brightGreen': _ansiBrightColorCode(32),
    'brightYellow': _ansiBrightColorCode(33),
    'brightBlue': _ansiBrightColorCode(34),
    'brightMagenta': _ansiColorCode(105),
    'brightCyan': _ansiBrightColorCode(106),
    'brightWhite': _ansiBrightColorCode(37),
    'backgroundBlack': _ansiColorCode(40),
    'backgroundRed': _ansiColorCode(41),
    'backgroundGreen': _ansiColorCode(42),
    'backgroundYellow': _ansiColorCode(43),
    'backgroundBlue': _ansiColorCode(44),
    'backgroundMagenta': _ansiColorCode(45),
    'backgroundCyan': _ansiColorCode(46),
    'backgroundWhite': _ansiColorCode(47),
    'backgroundBrightBlack': _ansiBrightColorCode(40),
    'backgroundBrightRed': _ansiBrightColorCode(41),
    'backgroundBrightGreen': _ansiBrightColorCode(42),
    'backgroundBrightYellow': _ansiBrightColorCode(43),
    'backgroundBrightBlue': _ansiBrightColorCode(44),
    'backgroundBrightMagenta': _ansiColorCode(115),
    'backgroundBrightCyan': _ansiBrightColorCode(46),
    'backgroundBrightWhite': _ansiBrightColorCode(47),
    'bold': _ansiColorCode(1),
    'reversed': _ansiColorCode(7),
    'underline': _ansiColorCode(4),
  };

  @override
  bool isValidColorCode(int code) => code > 0 || code <= 255;

  @override
  bool isValidColorName(String colorName) => _colorMap.containsKey(colorName);

  @override
  String colorFromName(String colorName, String text) {
    if (!isValidColorName(colorName)) {
      throw Exception('Color "$colorName" not supported');
    }

    final colorer = _colorMap[colorName];

    return '$colorer$text$reset';
  }

  @override
  String backgroundFromName(String colorName, String text) {
    final bgColorName = 'background${capitalize(colorName)}';

    return colorFromName(bgColorName, text);
  }

  @override
  String colorFromCode(int code, String text) {
    final colorer = _ansiColorCode(code);

    return isValidColorCode(code) ? '$colorer$text$reset' : text;
  }
}
